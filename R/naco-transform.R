#' Apply NACO normalization (Authority File Comparison Rules)
#' 
#' 'naco_transform()' applies the authority file comparison
#' rules (NACO normalization) to a string
#' @description Transform (normalize) a string for according to
#' LOC's Authority file comparison rules.
#' @usage naco_transform(s, firstcomma=FALSE, encoding="UTF-8")
#' @param s String 
#' @param firstcomma Retain the first comma in the string
#' @param encoding UTF-8 only
#' @import stringi
#' @import dplyr
#'
#' @return Transformed (normalized) string
#' @seealso
#' * Please see \code{vignette("naco", package = "rnaco")} for a detailed walk-through of
#' the NACO authority file comparison rules.
#' @export
naco_transform <- function(str, firstcomma=FALSE, encoding="UTF-8") {
    library(dplyr)
    library(magrittr)
    library(stringi)
    step2str <- stringi::stri_trim_both(str, pattern = "\\P{Wspace}", negate = FALSE)
    step4str <- .step4(step2str)
    step5str <- .step5(step4str)
    step6str <- stringi::stri_trans_general(step5str,id=rnaco::step6rulestring,rules=TRUE)
    step7removeStr <- stringi::stri_replace_all_regex(step6str,
                        pattern = "(\\p{Cc}|\\p{Cf}|\\p{Co}|\\p{Cs}|\\p{Lm}|\\p{Mc}|\\p{Me}|\\p{Mn})",
                        replacement="")
    step7uppered <- .step7toupper(step7removeStr)
    step7dn <- .step7decimalnumeral(step7uppered)
    step7Pc <- stringi::stri_replace_all_charclass(step7dn, "\\p{Pc}", " ")
    step7Pd <- stringi::stri_replace_all_charclass(step7Pc, "\\p{Pd}", " ")
    step7Pe <- .step7closepunctuation(step7Pd)
    step7Pf <- stringi::stri_replace_all_charclass(step7Pe, "\\p{Pf}", " ")
    step7Pi <- stringi::stri_replace_all_charclass(step7Pf, "\\p{Pi}", " ")
    step7Po <- .step7otherpunctuation(step7Pi, firstcomma)
    step7Ps <- .step7openpunctuation(step7Po)
    step7Sk <- stringi::stri_replace_all_charclass(step7Ps, "\\p{Sk}", " ")
    step7Sm <- stringi::stri_replace_all_regex(step7Sk, "[\\p{Sm}-[\u002B\u266F]]", " ")
    step7So <- stringi::stri_replace_all_regex(step7Sm, "[\\p{So}-[\u266D]]", " ")
    step7Z <- stringi::stri_replace_all_regex(step7So, "[\\p{Zl}|\\p{Zp}|\\p{Zs}]", " ")
    step8 <- .step8(step7Z, step6str)
    step9 <- stringi::stri_replace_all_charclass(step8, '\\p{WHITE_SPACE}', ' ', merge=TRUE)
    step10 <- stringi::stri_trim_both(step9, pattern = "\\P{Wspace}")
    return(step10)
}

.step5 <- function(str){
    result <- lapply(str, function(s) {
        s1 <- ""
        s2 <- s
        while( stringi::stri_cmp_neq(s1, s2)){
            s1 <- s2
            s2 <- stringi::stri_trans_nfkd(s1)
        }
        return(s2)
    })
}

.step8 <- function(strlist1, strlist2){
    fn <- function(sx, sy) ifelse(stringi::stri_length(sx) == 0, sy, sx)
    resstr <- mapply(fn, strlist1, strlist2, SIMPLIFY = TRUE, USE.NAMES = FALSE)
    return(resstr)
}

.step7openpunctuation <- function(str, encoding="UTF-8") {
    resstr1 <- stringi::stri_replace_all_fixed(str, "\u005B", "")
    resstr2 <- stringi::stri_replace_all_charclass(resstr1, "\\p{Ps}", " ")
    return(resstr2)
}

.step7otherpunctuation <- function(str, firstcomma, encoding="UTF-8") {
    resstr0 <- stringi::stri_replace_all_regex(str, "[,]\\z", "")
    resstr1 <- stringi::stri_replace_all_fixed(resstr0, "\u0027", "")
    pattern <- "[\\p{Po}-[\u0023\u0026\u002C\u0040]]"
    resstr2 <- stringi::stri_replace_all_regex(resstr1, pattern, " ")
    ncommas <- stringi::stri_split_fixed(resstr2,",", n=2)
    resstr3 <- lapply(ncommas, function(v) stringi::stri_replace_all_fixed(v, ",", " ") )
    resstr4 <- unlist(lapply(resstr3, function(v) stringi::stri_join(v, collapse=",")))
    if(firstcomma == FALSE) {resstr4 <- stringi::stri_replace_all_fixed(resstr4, ",", " ")}

    return(resstr4)
}

.step7closepunctuation <- function(str, encoding="UTF-8") {
    resstr <- stringi::stri_replace_all_fixed(str, "\u005D", "")
    resstr2 <- stringi::stri_replace_all_charclass(resstr, "\\p{Pe}", " ")
    return(resstr2)
}

.step7decimalnumeral <- function(str, encoding="UTF-8") {
    numericchrs <- unlist(stringi::stri_extract_all_regex(str, "(\\p{Nd})")) %>% unique()
    ruleset <- rnaco::numericrules %>% filter(from %in% numericchrs) %>% select(rule)
    translitrule <- stringi::stri_join(ruleset$rule,collapse=" ")
    result <- stringi::stri_trans_general(str, id=translitrule , rules=TRUE)
    return(result)
}

.step7toupper  <- function(str, encoding="UTF-8") {
    resstr1 <- stringi::stri_trans_general(str, id = step7lltranslitrule, rules = TRUE)
    resstr2 <- stringi::stri_trans_toupper(resstr1, locale = NULL)
    return(resstr2)
}

.step4 <- function(str, encoding="UTF-8") {
    rhex <- stringi::stri_trans_general(str, id="Any-Hex/Unicode")
    rhex <- stringi::stri_match_all_regex(rhex, "(?:U[+])([A-F0-9]++)")
    set <- as.hexmode(rhex[[1]][,2])
    rz <- rnaco::unconditionalMappings %>%
            dplyr::filter(ucs %in% set) %>%
        dplyr::mutate(from = intToUtf8(ucs, multiple = TRUE), to = upper) %>%
        dplyr::select(from,to) %>% unique() %>%
        dplyr::mutate(rule = paste0(from," > ",to," ;",sep="" )) %>%
        dplyr::select(rule)
    rzf <- stringi::stri_join(as.vector(rz$rule), collapse=" ")
    step4result <- stringi::stri_trans_general(str, id=rzf, rules=TRUE)
    return(step4result)
}