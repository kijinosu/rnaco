#' Data frame (tibble) from xml
#'
#' @description Transform (normalize) a string for VIAF comparisons.
#' @usage viaf_transform(s, mode=c("name","title"), encoding="UTF-8")
#' @param s String 
#' @param mode "title" mode removes all spaces. "name" mode leaves single
#' spaces between name parts.
#' @import stringi
#' @import dplyr
#'
#' @return Transformed (normalized) string
#' @export
viaf_transform <- function(s, mode="name", encoding="UTF-8") {
    library(stringi)
    rs1 <- viaf_cjk_transform(s, encoding=encoding)

    #rs <- stringi::stri_replace_all_charclass(rs, "\\p{Po}", "")
    rs2 <- rnaco::naco_transform(rs1, firstcomma=FALSE)

    rs3 <- lapply(rs2, function(v) {
            r1 <- ifelse( stringi::stri_detect_charclass(v, "[:Katakana:]", negate = FALSE, max_count = 1),
                .viaf_translit_transform(v, id = .katakanarules()), 
                v )
            r2 <- ifelse( stringi::stri_detect_charclass(r1, "[:Hiragana:]", negate = FALSE, max_count = 1),
                .viaf_translit_transform(r1, id = .hiraganarules()), 
                r1 )
            })

    if(mode == "title")
        rs3 <- stringi::stri_replace_all_charclass(rs3, "\\p{WHITE_SPACE}", "")

    rs <- stringi::stri_trans_tolower(rs2, locale = NULL)
    return(rs)
}

.viaf_translit_transform <- function(str, id = NULL) {
    result <- stri_trans_general(str, id = id, rules = TRUE)
    return(result)
}

.katakanarules <- function() { " [ガ] > カ ; [ギ] > キ ; [グ] > ク ; [ゲ] > ケ ; [ゴ] > コ ;
                                 [ザ] > サ ; [ジ] > シ ; [ズ] > ス ; [ゼ] > セ ; [ゾ] > ソ ;
                                 [ダ] > タ ; [ヂ] > チ ; [ヅ] > ツ ; [デ] > テ ; [ド] > ト ;
                                 [バパ] > ハ ; [ビピ] > ヒ ; [ブプ] > フ ; [ベペ] > ヘ ; [ボポ] > ホ ;
                                 [・] > \u0020 ; [ー] > ; [ヸ] > ヰ ; [ヹ] > ヱ ; [グ] > ク ; [ヺ] > ヲ ;
                                 [ヴ] > ウ ; [ヷ] > ワ ;"}

.hiraganarules <- function() { " [が] > か ; [ぎ] > き ; [ぐ] > く ; [げ] > け ; [ご] > こ ;
                                 [ざ] > さ ; [じ] > し ; [ず] > す ; [ぜ] > せ ; [ぞ] > そ ;
                                 [だ] > た ; [ぢ] > ち ; [づ] > つ ; [で] > て ; [ど] > と;
                                 [ばぱ] > は　; [びぴ] > ひ ; [ぶぷ] > ふ ; [べぺ] > へ ; [ぼぽ] > ほ ;
                                 [ゔ] > う ; [\u3099\u309a\u309b\u309c] > ; [ゞ] > ゝ ;"}
