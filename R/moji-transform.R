#' Apply normalization based on CITPC MJ Map
#' @name moji_transform
#' @description Transform (normalize) a string for VIAF comparisons.
#' @usage moji_transform(s, encoding="UTF-8")
#' @param s String 
#' @import stringi
#' @import dplyr
#' @return Transformed (normalized) string
#' @export
moji_transform <- function(s, encoding="UTF-8") {
    library(stringi)
    library(dplyr)
    rs <- s

# Get the replacements in the form of a string with 
# semicolon-separated transliteration rules (see the ICU manual)
    rpl <- unlist(lapply(rs, function(v) {
            tryCatch({
                .get_moji_replacements(v)
                }, 
            warning = function(cond) {
                message(paste("Warning: moji_transform:get_moji_replacements:",v))
                message(paste("Content: ", as.character(v)))
                message(conditionMessage(cond))
                },
            error = function(cond) {
                message(paste("Warning: moji_transform:get_moji_replacements:",v))
                message(paste("Content: ", as.character(v)))
                message(conditionMessage(cond))
                }
            )
        }))

    tryCatch(
    {
        rs2 <- lapply(rs, function(s) {
            ifelse(is.null(rpl), s,
                stringi::stri_trans_general(s,id=rpl, rules = TRUE))
        })
    }, 
    warning = function(cond) {
          message(paste("Warning: moji_transform:stri_trans_general:",s))
          message(paste("Content: ", as.character(rpl)))
          message(conditionMessage(cond))
        },
    error = function(cond) {
          message(paste("Warning: moji_transform:stri_trans_general:",s))
          message(paste("Content: ", as.character(rpl)))
          message(conditionMessage(cond))
        }
   
    )

    return(unlist(rs2))
}

.get_moji_replacements <- function(ucs) {
    cv <- stri_sub_all(ucs,rep(1:stri_length(ucs),1), length=rep(1,stri_length(ucs))) %>% unlist()
    ret <- unique(cv ) %>% sort() %>%
		stringi::stri_trans_general(id="Any-Hex/Unicode") %>%
		stri_replace_all_fixed("U+","0x") %>% strtoi() %>% as.hexmode()   

    ret2 <- lapply(ret, function(vec){
        var = dplyr::filter(rnaco::mojiVariants, 
                            ucsindex == vec)
        })
    ret3 <- dplyr::bind_rows(ret2)
    if(nrow(ret3) == 0) return(NULL) 

    ret4 <- ret3 %>% dplyr::select(rule) 

    ret5 <- stringi::stri_join(as.vector(ret4$rule), collapse=" ")

    return(ret5)
}