#' @description Transform (normalize) a CJK string for VIAF comparisons.
#' @usage viaf_cjk_transform(s, encoding="UTF-8")
#' @param s String 
#' @param mode "title" mode removes all spaces. "name" mode leaves single
#' spaces between name parts.
#' @import stringi
#' @import dplyr
#'
#' @return Transformed (normalized) string
#' @export
viaf_cjk_transform <- function(s, encoding="UTF-8") {
    library(stringi)
    library(dplyr)
    rs <- s

# first do simple transformation to simplified characters
    rs <- stringi::stri_trans_general(s, id="Traditional-Simplified")

# Then do look ups for variants.
    rhex <- stringi::stri_trans_general(rs , id="Any-Hex/Unicode")
# Get a list of code points out of this string of code points
    ms <- lapply(rhex, function(s) {
        stringi::stri_match_all(s,regex = "(?:U[+])([A-F0-9]++)")[[1]][,2]
    })
    rm <- lapply(ms, function(s) {
        as.hexmode(paste0("0x",s,sep=""))
        })
# Get the semantic replacements in the form of a string with 
# semicolon-separated transliteration rules (see the ICU manual)
    rpl <- unlist(lapply(rm, function(v) {.get_replacements(v)}))
    rls <- stringi::stri_join(as.vector(rpl), collapse=" ")

    rs2 <- lapply(rs, function(s) {
        stringi::stri_trans_general(s,id=rls, rules = TRUE)
    })

    return(unlist(rs2))
}


.get_replacements <- function(ucs) {
    ret <- unique(ucs) %>% sort() %>% as.hexmode()
    ret2a <- lapply(ret, function(vec){
        var = dplyr::filter(rnaco::unihan_variants, 
                            ucsindex == vec, 
                            varianttype == "kSemanticVariant")
        })
    ret2b <- lapply(ret, function(vec){
        var = dplyr::filter(rnaco::unihan_variants, 
                            ucsindex == vec, 
                            varianttype == "kSpecializedSemanticVariant")
        })
    
    ret3 <- dplyr::bind_rows(ret2a,ret2b) %>%
        dplyr::filter(ucsindex > ucsvariant) %>%
        dplyr::mutate(from = intToUtf8(ucsindex, multiple = TRUE), to = intToUtf8(ucsvariant, multiple = TRUE)) %>%
        dplyr::select(from,to) %>% unique() %>%
        dplyr::mutate(rule = paste0(from," > ",to," ;",sep="" )) %>%
        dplyr::select(rule) 

    ret4 <- stringi::stri_join(as.vector(ret3$rule), collapse=" ")

    return(ret4)
}