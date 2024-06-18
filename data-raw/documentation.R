#' rnaco
#' A data package for rnaco.
#' @aliases rnaco-package
#' @title R implemention of NACO normalization.
#' @name rnaco
#' @description A description of the data package
#' @details Use \code{data(package='rnaco')$results[, 3]} to see a list of available data sets in this data package
#'     and/or DataPackageR::load_all
#' _datasets() to load them.
#' @seealso
#' \link{marcNotes}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
'_PACKAGE'



#' Detailed description of the data
#' @name marcNotes
#' @docType data
#' @title Names, XPaths and notes for MARC-8 code tables
#' @description The source xml file, codetables.xml, contains
#' named character sets and groupings of character sets together
#' informative notes. This dataset contains the names, XPath locations
#' of the character sets or groupings, and the notes pertaining to
#' the respective sets or groupings.
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marcName}{name of code table}
#' \item{marcPath}{XPath location of table in source xml}
#' \item{marcNote}{notes from source xml}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcNotes}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL






#' Detailed description of the data
#' @name marcBasicLatinASCII
#' @docType data
#' @title Basic Latin (ASCII) code table (January 2000) ISOcode=42
#' @description From the Basic and Extended Latin character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcNotes}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcBasicArabic
#' @docType data
#' @title Basic Arabic code table, ISOcode=33 (July 2001)
#' @description From the Basic and Extended Arabic character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcBasicCyrillic
#' @docType data
#' @title Basic Cyrillic code table, ISOcode=4E (January 2000)
#' @description From the Basic and Extended Cyrillic character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcBasicGreek
#' @docType data
#' @title Basic Greek code table, ISOcode=53 (January 2000)
#' @description From the Greek character set
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcBasicHebrew
#' @docType data
#' @title Basic Hebrew code table, ISOcode=32 (January 2000)
#' @description From the Basic Hebrew character set
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcComponentInputMethodCharacters
#' @docType data
#' @title Component Input Method Characters code table (February 6, 2003)
#' @description This table contains 35 mappings of encodings for component input method characters from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC") to character encodings in the Private Use Area (PUA) of the Universal Character Set (UCS, ISO-IEC 10646)/Unicode. Character codes are given in hexadecimal notation. Each character is presented on a separate row.
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcEastAsianIdeographsHan
#' @docType data
#' @title East Asian Ideographs ('Han') code table (February 6, 2003)
#' @description This table contains 13,478 mappings of character encodings for East Asian ideographs from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC", including 10 "Version J" additions that did not appear in the published standard) to character encodings in the Universal Character Set (UCS, ISO-IEC 10646)/Unicode. Character codes are given in hexadecimal notation. Each character is presented on a separate row.
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcEastAsianPunctuationMarks
#' @docType data
#' @title East Asian Punctuation Marks code table (February 6, 2003)
#' @description This table contains 25 mappings of character encodings for East Asian punctuation marks from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC") to character encodings in the Universal Character Set (UCS, ISO-IEC 10646)/Unicode. Character codes are given in hexadecimal notation.
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcExtendedArabic
#' @docType data
#' @title Extended Arabic code table, ISO code 34 (July 2001)
#' @description From the Basic and Extended Arabic character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcExtendedCyrillic
#' @docType data
#' @title Extended Cyrillic code table, ISO code 51 (January 2000)
#' @description From the Basic and Extended Cyrillic character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcExtendedLatinANSEL
#' @docType data
#' @title Extended Latin (ANSEL) code table, ISO code 45 (January 2000, Updated September 2004)
#' @description From the Extended Latin (ANSEL) character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcGreekSymbols
#' @docType data
#' @title Greek Symbols
#' @description Greek Symbols code table, ISO code 67 (January 2000, Updated September 2004)
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcJapaneseHiraganaandKatakana
#' @docType data
#' @title Japanese Hiragana and Katakana code table (February 6, 2003)
#' @description This table contains 172 mappings of character encodings for Japanese Hiragana and Katakana from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC") to character encodings in the Universal Character Set (UCS, ISO-IEC 10646)/Unicode.
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcKoreanHangul
#' @docType data
#' @title Korean Hangul code table (February 6, 2003)
#' @description This table contains 2,028 mappings of character encodings for Korean hangul from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC") to character encodings in the Universal Character Set (UCS, ISO-IEC 10646)/Unicode. 
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcSubscripts}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcSubscripts
#' @docType data
#' @title Subscripts
#' @description Subscripts code table, ISO code 62 (January 2000)
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSuperscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name marcSuperscripts
#' @docType data
#' @title Superscripts
#' @description Superscripts code table, ISO code 70 (January 2000)
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point <hexmode>}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
#' \link{unihan_variants}
NULL




#' Detailed description of the data
#' @name unihan_variants
#' @docType data
#' @title Unihan CJK variants
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucsindex}{UCS/Unicode code point <hexmode>}
#' \item{varianttype}{Type of variant, e.g., kSemanticVariant}
#' \item{ucsvariant}{UCS/Unicode code point <hexmode>}
#' }
#' @description Variants loaded from the Unicode Han Database. Lists of
#' variants have been unnested so that there is only one character and one variant per line.
#' This is at the expense of having multiple rows for ucsindexes that have multiple variants.
#' @source The data comes from the [UNICODE HAN DATABASE](https://www.unicode.org/reports/tr38/)[@jenkins2021uax]
#' provides a file Unihan.zip that contains a file Unihan\_Variants.txt.
#' @seealso
#' \link{rnaco}
#' \link{marcBasicArabic}
#' \link{marcBasicCyrillic}
#' \link{marcBasicGreek}
#' \link{marcBasicHebrew}
#' \link{marcComponentInputMethodCharacters}
#' \link{marcEastAsianIdeographsHan}
#' \link{marcEastAsianPunctuationMarks}
#' \link{marcExtendedArabic}
#' \link{marcExtendedCyrillic}
#' \link{marcExtendedLatinANSEL}
#' \link{marcGreekSymbols}
#' \link{marcJapaneseHiraganaandKatakana}
#' \link{marcKoreanHangul}
#' \link{marcSubscripts}
NULL
