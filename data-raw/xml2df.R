#' Data frame (tibble) from xml
#'
#' @description
#' 'xml2df()' reads a specially structured xml, transforms it to an
#' xml, and from that xml produces a tibble. 
#'
#' An example of the special structure is below. 
#' The names of the elements under the rows will become the
#' column names. The columns will have the type given by
#' the 'ct' attribute.
#' 
#' \preformatted{
#' <marcEastAsianIdeographsHan>
#' <row>
#' <marc ct="character">212F30</marc>
#' <ucs ct="character">0x3007</ucs>
#' <utf8 ct="character">E38087</utf8>
#' <isAlt ct="logical"/>
#' <isCombining ct="logical"/>
#' <name ct="character">East Asian ideograph (number zero)</name>
#' </row>
#'   ...
#' </marcEastAsianIdeographsHan>
#' }
#'
#' @usage xml2df(x)
#' @param x Loaded xml document.
#' @import dplyr
#' @import purrr
#' @import stringi
#' @import tidyr
#' @import xml2
#' @import xslt
#' @importFrom tibble tibble
#' @importFrom magrittr "%>%"
#' @importFrom lubridate ymd_hms now ymd
#'
#' @return The desired tibble.
#' @export
xml2df <- function(x) {
  chlds <- xml2::xml_find_all(xml2::xml_root(x), "row")
  labs <- base::trimws(xml2::xml_name(xml2::xml_children(chlds[1])))
  colclasses <- xml2::xml_attr(xml2::xml_children(chlds[1]), "ct")
  df <- utils::read.table(text = "", colClasses = colclasses, col.names = labs)
  len <- length(chlds)
  for (i in 1:len) {
    cells <- xml2::xml_children(chlds[i])
    nocells <- length(cells)

    dv <- read.table(text = "", colClasses = colclasses, col.names = labs)
    for (j in 1:nocells) {
      cellcontents <- xml2::xml_contents(cells[j])
      tryCatch(
        {
          dv[1, j] <- switch(colclasses[j],
              "character" = as.character(cellcontents), # nolint
              "Date" = lubridate::ymd(xml2::xml_text(cells[j]),truncated = 2, quiet = TRUE), # nolint
              "POSIXct" = lubridate::ymd_hms(xml2::xml_text(cells[j]), quiet = TRUE), # nolint
              "factor" = as.factor(xml2::xml_text(cells[j])),
              "logical" = as.logical(xml2::xml_text(cells[j])),
              "integer" = as.integer(xml2::xml_text(cells[j])))
        },
        error = function(cond) {
          message(paste("Error: xml2df Record ", i, " Cell ", j))
          message(paste("Content: ", as.character(xml2::xml_text(cells[1:j]))))
          message(conditionMessage(cond))
        },
        warning = function(cond) {
          message(paste("Warning: xml2df Record ", i, " Cell ", j))
          message(paste("Content: ", as.character(xml2::xml_text(cells[1:j]))))
          message(conditionMessage(cond))
        }
      )
    }
    df <- rbind(df, dv)
  }
  result <- dplyr::tibble(df)
  return(result)
}