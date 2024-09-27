#' Get transiteration rules
#' 
#' @name nacotransform
#' @description Transform (normalize) a string for according to
#' LOC's Authority file comparison rules.
#' 
#' @usage get_transliteration_rules(s, encoding="UTF-8")
#' @param s String 
#' @param encoding UTF-8 only
#' @import stringi
#' @import dplyr
#'
#' @return character string containing ICU transliteration rules for
#' input string
#' @export
get_transliteration_rules <- function(s, encoding="UTF-8") {
    library(dplyr)
    library(magrittr)
    library(stringi)
    result <- lapply(s, function(v) .get_trans_rule(v, encoding))
    return(result)
}

.get_trans_rule <- function(s, encoding="UTF-8") {
    res <- s
    cv <- stringi::stri_sub_all(ucs,rep(1:stri_length(s),1), length=rep(1,stri_length(s))) %>% unlist()
    ret <- unique(cv ) %>% sort() %>%
		stringi::stri_trans_general(id="Any-Hex/Unicode") %>%
		stringi::stri_replace_all_fixed("U+","0x") %>% strtoi() %>% as.hexmode()   

    ret2a <- lapply(ret, function(vec){
        var = dplyr::filter(unihanMarcVariants, 
                            ucsindex == vec,
                            varianttype %in% c("kSemanticVariant","kSpecializedSemanticVariant")) %>%
                dplyr::filter(!is.na(marcvariant))
        })
    ret2b <- lapply(ret, function(vec){
        var = dplyr::filter(unihanMarcVariants, 
                            ucsvariant == vec,
                            varianttype %in% c("kSemanticVariant","kSpecializedSemanticVariant") ) %>%
                dplyr::filter(!is.na(marcvariant))
        })
    ret3 <- dplyr::bind_rows(ret2a,ret2b) %>% dplyr::filter(ucsindex > ucsvariant)
    if(nrow(ret3) == 0) return(NULL) 

    ret4 <- ret3 %>% 
            select(ucsindex,ucsvariant) %>% 
            group_by(ucsindex) %>% 
            mutate(minvar = min(ucsvariant)) %>% 
            ungroup() %>%
            mutate(ucsvariant = as.hexmode(minvar)) %>% 
            select(-minvar) %>%
            unique()

    if(nrow(ret4) == 0) return(NULL)  

    ret5 <- ret4 %>%
        dplyr::mutate(from = intToUtf8(ucsindex, multiple = TRUE), to = intToUtf8(ucsvariant, multiple = TRUE)) %>%
        dplyr::select(from,to) %>% unique() %>%
        dplyr::mutate(rule = paste0(from," > ",to," ;",sep="" )) %>%
        dplyr::select(rule) 

    ret6 <- stringi::stri_join(as.vector(ret5$rule), collapse=" ")

    return(ret6)
    }