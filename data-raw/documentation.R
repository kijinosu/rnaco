#' rnaco
#' A data package for rnaco.
#' @aliases rnaco-package
#' @title DName Normalization for the VIAF API
#' @name rnaco
#' @description This package combines, in one place, data and functions for
#'      normalizing transforms of names and titles in VIAF records. Please
#'      see the vignettes for details.
#' @details Use \code{data(package='rnaco')$results[, 3]} to see a list of available data sets in this data package
#'     and/or DataPackageR::load_all
#' _datasets() to load them.
#' @seealso
#' \link{marcNotes}
#' \link{marctables}
#' \link{mojiMapdf}
#' \link{mojiVariants}
#' \link{unihanVariants}
#' \link{nacotransform}
#' \link{cjkextracts}
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
#' \link{marctables}
#' \link{unihanVariants}
#' \link{nacotransform}
#' \link{cjkextracts}
#' \href{../doc/marctables.html}{\code{vignette("marctables", package = "rnaco")}}
NULL









#' Detailed description of the data
#' @name marcBasicLatinASCII
#' @docType data
#' @rdname marctables
#' @title Basic Latin (ASCII) code table (January 2000) ISOcode=42
#' @description From the Basic and Extended Latin character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point (hexmode)}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
#' @details See the vignette `vignette("marctables")`.
#' @source The data comes from the [Library of Congress](https://www.loc.gov/marc/specifications/codetables.xml "MARC specification").
#' @seealso
#' \link{rnaco}
#' \link{marcNotes}
#' \link{marctables}
#' \link{unihanVariants}
#' \link{nacotransform}
#' \link{cjkextracts}
#' \href{../doc/marctables.html}{\code{vignette("marctables", package = "rnaco")}}
NULL







#' Detailed description of the data
#' @name marcBasicArabic
#' @rdname marctables
#' @docType data
#' @title Basic Arabic code table, ISOcode=33 (July 2001)
#' @description From the Basic and Extended Arabic character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point (hexmode)}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
NULL







#' Detailed description of the data
#' @name marcBasicCyrillic
#' @rdname marctables
#' @docType data
#' @title Basic Cyrillic code table, ISOcode=4E (January 2000)
#' @description From the Basic and Extended Cyrillic character sets
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point (hexmode)}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
NULL







#' Detailed description of the data
#' @name marcBasicGreek
#' @rdname marctables
#' @docType data
#' @title Basic Greek code table, ISOcode=53 (January 2000)
#' @description From the Greek character set
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point (hexmode)}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
NULL







#' Detailed description of the data
#' @name marcBasicHebrew
#' @rdname marctables
#' @docType data
#' @title Basic Hebrew code table, ISOcode=32 (January 2000)
#' @description From the Basic Hebrew character set
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point (hexmode)}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
NULL







#' Detailed description of the data
#' @name marcComponentInputMethodCharacters
#' @rdname marctables
#' @docType data
#' @title Component Input Method Characters code table (February 6, 2003)
#' @description This table contains 35 mappings of encodings for component input method characters from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC") to character encodings in the Private Use Area (PUA) of the Universal Character Set (UCS, ISO-IEC 10646)/Unicode. Character codes are given in hexadecimal notation. Each character is presented on a separate row.
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point (hexmode)}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
NULL







#' Detailed description of the data
#' @name marcEastAsianIdeographsHan
#' @rdname marctables
#' @docType data
#' @title East Asian Ideographs ('Han') code table (February 6, 2003)
#' @description This table contains 13,478 mappings of character encodings for East Asian ideographs from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC", including 10 "Version J" additions that did not appear in the published standard) to character encodings in the Universal Character Set (UCS, ISO-IEC 10646)/Unicode. Character codes are given in hexadecimal notation. Each character is presented on a separate row.
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{marc}{MARC-8 code (in hex) for the character as coming from the G0 graphic set}
#' \item{ucs}{UCS/Unicode code point (hexmode)}
#' \item{utf8}{UTF-8 code (in hex) for the UCS character}
#' \item{rep}{representation of the character (where possible)}
#' \item{isAlt}{For some tables alternate encodings in Unicode and UTF-8 are given.
#' When that occurs the alternate Unicode and alternate UTF-8 columns follow the character name.}
#' \item{isCombining}{}
#' \item{name}{MARC character name, followed by the UCS name}
#' }
NULL







#' Detailed description of the data
#' @name marcEastAsianPunctuationMarks
#' @rdname marctables
#' @docType data
#' @title East Asian Punctuation Marks code table (February 6, 2003)
#' @description This table contains 25 mappings of character encodings for East Asian punctuation marks from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC") to character encodings in the Universal Character Set (UCS, ISO-IEC 10646)/Unicode. Character codes are given in hexadecimal notation.
NULL







#' Detailed description of the data
#' @name marcExtendedArabic
#' @rdname marctables
#' @docType data
#' @title Extended Arabic code table, ISO code 34 (July 2001)
#' @description From the Basic and Extended Arabic character sets
NULL







#' Detailed description of the data
#' @name marcExtendedCyrillic
#' @rdname marctables
#' @docType data
#' @title Extended Cyrillic code table, ISO code 51 (January 2000)
#' @description From the Basic and Extended Cyrillic character sets
NULL







#' Detailed description of the data
#' @name marcExtendedLatinANSEL
#' @rdname marctables
#' @docType data
#' @title Extended Latin (ANSEL) code table, ISO code 45 (January 2000, Updated September 2004)
#' @description From the Extended Latin (ANSEL) character sets
NULL







#' Detailed description of the data
#' @name marcGreekSymbols
#' @rdname marctables
#' @docType data
#' @title Greek Symbols
#' @description Greek Symbols code table, ISO code 67 (January 2000, Updated September 2004)
NULL







#' Detailed description of the data
#' @name marcJapaneseHiraganaandKatakana
#' @rdname marctables
#' @docType data
#' @title Japanese Hiragana and Katakana code table (February 6, 2003)
#' @description This table contains 172 mappings of character encodings for Japanese Hiragana and Katakana from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC") to character encodings in the Universal Character Set (UCS, ISO-IEC 10646)/Unicode.
NULL







#' Detailed description of the data
#' @name marcKoreanHangul
#' @rdname marctables
#' @docType data
#' @title Korean Hangul code table (February 6, 2003)
#' @description This table contains 2,028 mappings of character encodings for Korean hangul from the East Asian Coded Character set (ANSI/NISO Z39.64, or "EACC") to character encodings in the Universal Character Set (UCS, ISO-IEC 10646)/Unicode. 
NULL







#' Detailed description of the data
#' @name marcSubscripts
#' @rdname marctables
#' @docType data
#' @title Subscripts
#' @description Subscripts code table, ISO code 62 (January 2000)
NULL







#' Detailed description of the data
#' @name marcSuperscripts
#' @rdname marctables
#' @docType data
#' @title Superscripts
#' @description Superscripts code table, ISO code 70 (January 2000)
NULL







#' Detailed description of the data
#' @name unihanVariants
#' @docType data
#' @title Unihan CJK variants
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucsindex}{UCS/Unicode code point (hexmode)}
#' \item{varianttype}{Type of variant, e.g., kSemanticVariant}
#' \item{ucsvariant}{UCS/Unicode code point (hexmode)}
#' }
#' @description Variants loaded from the Unicode Han Database. Lists of
#' variants have been unnested so that there is only one character and one variant per line.
#' This is at the expense of having multiple rows for ucsindexes that have multiple variants.
#' @source The data comes from the [UNICODE HAN DATABASE](https://www.unicode.org/reports/tr38/)[@jenkins2021uax]
#' provides a file Unihan.zip that contains a file Unihan\_Variants.txt.
#' @seealso
#' \link{rnaco}
#' \link{cjkextracts}
#' \link{marcNotes}
#' \link{marctables}
#' \link{nacotransform}
#' \href{../doc/unihanVariants.html}{\code{vignette("unihanVariants", package = "rnaco")}}
NULL







#' @name unconditionalMappings
#' @rdname nacotransform
#' @docType data
#' @title Unconditional mappings for naco_transform()
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucs}{UCS/Unicode code point (hexmode)}
#' \item{lower}{Lower case mapping}
#' \item{title}{Title case mapping}
#' \item{upper}{Upper case mapping}
#' \item{name}{UCS name}
#' }
#' @description The 2009 version of the authority file comparison rules call
#' for using the unconditional mappings from the
#' Unicode® Standard.
#' These mappings provide lower, title and upper case mapping for characters such as
#' the German ß (U+00DF, Latin small letter sharp S).
#' The mappings used
#' for this package are found in the file SpecialCasings.txt, which is contained in the
#' file UCD.zip
#' @source The data comes from the [Unicode® Standard](https://www.unicode.org/versions/Unicode15.1.0/)
#' provides a file UCD.zip that contains the file SpecialCasings.txt.
#' @seealso
#' \link{rnaco}
#' \link{marcNotes}
#' \link{marctables}
#' \link{unihanVariants}
#' \link{nacotransform}
#' \link{cjkextracts}
#' \href{../doc/naco.html}{\code{vignette("naco", package = "rnaco")}}
#' \href{../doc/nacoDatasets.html}{\code{vignette("nacoDatasets", package = "rnaco")}}
NULL






#' @name numericrules
#' @rdname nacotransform
#' @docType data
#' @title Transliteration rules for numeric decimals
#' @format numericrules is a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{V1}{chr: code point}
#' \item{V2}{chr: name of code point}
#' \item{V3}{chr: Unicode category}
#' \item{V8}{int: Integer replacement for code point}
#' \item{from}{chr: Character for transliteration rule}
#' \item{to}{chr: Character for transliteration rule}
#' \item{rule}{chr: Transliteration rule}
#' }
NULL






#' @name step6rulestring
#' @rdname nacotransform
#' @docType data
#' @title Transliteration rule Step 6 of naco_transform()
#' @format step6rulestring is in the form of a \code{string} 
NULL






#' Detailed description of the data
#' @name step7lltranslitrule
#' @rdname nacotransform
#' @docType data
#' @title Transliteration rule Step 7 of naco_transform()
#' @format step7lltranslitrule is in the form of a \code{string} 
NULL





#' Personal name authority records
#' @name cjkextractja
#' @rdname cjkextracts
#' @docType data
#' @title Personal name authority records
#' @description The [NACO CJK Funnel References Project Guidelines](https://www.loc.gov/aba/pcc/naco/CJK/NACO-CJK-Funnel-References-Project-Guidelines.docx)[@naco2019naco]
#' refer to three Google spreadsheets containing personal name authorities for use
#' in the funnel project. These spreadsheets derive from 268,128 records extracted by
#' Gary Strawn. While they emphasize Chinese, Japanese and Korean, when coupled
#' with VIAF they access a rich resource of name authority records from
#' the various VIAF contributors in various languages. Please refer to the
#' [Descriptive Cataloging Manual](https://www.loc.gov/aba/publications/FreeDCM/DCM/Z01.pdf)
#' for detailed information on the tag fields. For example, the tag009_32 and tag670
#' columns relate to compliance with RDA name authority records.
#' @format cjkextractja is a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{lccn}{LC control number, lower case 'n', no space}
#' \item{tag008_32}{Descriptive cataloging rule. Differentiated personal name when coded “a”}
#' \item{tag100_field}{Name in the 100 field}
#' \item{tag400_CJK}{Number of Chinese, Japanese or Korean references in 400 fields}
#' \item{tag400_other}{Number of other non-Latin references in 400 fields}
#' \item{tag400_roman}{Number of Latin references in 400 fields}
#' \item{rda}{Whether or not RDA record}
#' \item{tag670}{Number of 670 fields}
#' \item{tag667}{Has non-Latin script reference been evaluated?}
#' \item{Language}{Language of name record}
#' }
#' @source The data comes from the NACO CJK Funnel References Project.
#' @seealso
#' \link{rnaco}
#' \link{marcNotes}
#' \link{marctables}
#' \link{unihanVariants}
#' \link{nacotransform}
#' \link{cjkextracts}
NULL





#' Personal name authority records
#' @name cjkextractzh
#' @rdname cjkextracts
#' @docType data
#' @format cjkextractzh is a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{lccn}{LC control number, lower case 'n', no space}
#' \item{tag008_32}{Descriptive cataloging rule. Differentiated personal name when coded “a”}
#' \item{tag100_field}{Name in the 100 field}
#' \item{tag400_CJK}{Number of Chinese, Japanese or Korean references in 400 fields}
#' \item{tag400_other}{Number of other non-Latin references in 400 fields}
#' \item{tag400_roman}{Number of Latin references in 400 fields}
#' \item{rda}{Whether or not RDA record}
#' \item{tag670}{Number of 670 fields}
#' \item{tag667}{Has non-Latin script reference been evaluated?}
#' \item{notes}{If not CJK or minority name}
#' }
NULL




#' Personal name authority records
#' @name cjkextractko
#' @rdname cjkextracts
#' @docType data
#' @format cjkextractko is a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{lccn}{LC control number, lower case 'n', no space}
#' \item{tag008_32}{Descriptive cataloging rule. Differentiated personal name when coded “a”}
#' \item{tag100_field}{Name in the 100 field}
#' \item{tag400_CJK}{Number of Chinese, Japanese or Korean references in 400 fields}
#' \item{tag400_other}{Number of other non-Latin references in 400 fields}
#' \item{tag400_roman}{Number of Latin references in 400 fields}
#' \item{rda}{Whether or not RDA record}
#' \item{tag670}{Number of 670 fields}
#' \item{tag667}{Has non-Latin script reference been evaluated?}
#' \item{tag400Hangul}{Number of Hangul references in 400 fields}
#' \item{Hangul_only}{}
#' \item{note}{}
#' }
NULL




#' Detailed description of the data
#' @name mojiMapdf
#' @docType data
#' @title Descriptive data title
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{mjcode}{}
#' \item{from}{}
#' \item{to}{}
#' \item{relation}{}
#' }
#' @source The data comes from the Japanese Character Information Technology Promotion Council. \link{https://moji.or.jp/mojikiban/}
#' @seealso
#' \link{rnaco}
#' \link{mojiVariants}
#' \link{unihanVariants}
NULL




#' Detailed description of the data
#' @name mojiVariants
#' @docType data
#' @title Descriptive data title
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucsindex}{}
#' \item{ucsvariant}{}
#' \item{membership}{}
#' \item{from}{}
#' \item{to}{}
#' \item{rule}{}
#' }
#' @source The data comes from the Japanese Character Information Technology Promotion Council. \link{https://moji.or.jp/mojikiban/}
#' @seealso
#' \link{rnaco}
#' \link{mojiMapdf}
#' \link{unihanVariants}
#' \href{../doc/citpcmojivariants.html}{\code{vignette("citpcmojivariants", package = "rnaco")}}
NULL





#' Detailed description of the data
#' @name jctPrecedence
#' @rdname jctPrecedence
#' @docType data
#' @title Unicode code point precedence tables based on kUnihanCore2020 source tags and educational grade levels
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucs}{Unicode code point of ideograph}
#' \item{kTotalStrokes}{Total strokes in ideograph}
#' \item{jCoreRank}{Ranking based on kUnihanCore2020 source tags favoring 'J' (Japan)}
#' \item{jpRank}{Ranking based on educational grade level of ideograph in Japan}
#' \item{gCoreRank}{Ranking based on kUnihanCore2020 source tags favoring 'G' (PRC)}
#' \item{zhRank}{Ranking based on educational grade level of ideograph in PRC}
#' \item{tCoreRank}{Ranking based on kUnihanCore2020 source tags favoring 'T' (Taiwan)}
#' \item{twRank}{Ranking based on educational grade level of ideograph in Taiwan}
#' }
#' @source The data comes from Japan's Ministry of Education, Culture, Sports, Science and Technology (MEXT);
#' \href{http://www.microweiidv.com/weipage/n9gradeword.htm}; and
#' \href{https://cd.jiajiaoban.com/e/20210314/604de778686f4.shtml}.
#' @seealso
#' \link{rnaco}
#' \href{../doc/unihanprecedencedata.html}{\code{vignette("unihanprecedencedata", package = "rnaco")}}
#' \href{../doc/kyoikuKanji.html}{\code{vignette("kyoikuKanji", package = "rnaco")}}
#' \href{../doc/xiaoxuewenziTW.html}{\code{vignette("xiaoxuewenziTW", package = "rnaco")}}
#' \href{../doc/xiaoxuewenziZH.html}{\code{vignette("xiaoxuewenziZH", package = "rnaco")}}
NULL




#' Detailed description of the data
#' @name kyoikuKanji
#' @rdname jctPrecedence
#' @docType data
#' @format kyoikuKanji is a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucs}{Unicode code point of ideograph}
#' \item{char}{Ideograph}
#' \item{jpGrade}{Grade level (1-6)}
#' }
NULL




#' Detailed description of the data
#' @name twXiaoxueWenzi
#' @rdname jctPrecedence
#' @docType data
#' @format twXiaoxueWenzi is a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucs}{Unicode code point of ideograph}
#' \item{char}{Ideograph}
#' \item{twGrade}{Grade level (1-9)}
#' }
NULL




#' Detailed description of the data
#' @name zhXiaoxueWenzi
#' @rdname jctPrecedence
#' @docType data
#' @format zhXiaoxueWenzi is a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucs}{Unicode code point of ideograph}
#' \item{char}{Ideograph}
#' \item{zhGrade}{Grade level (1-6)}
#' }
NULL



#' Detailed description of the data
#' @name unihanPrecedenceData
#' @rdname jctPrecedence
#' @docType data
#' @title Data used for calculating ideograph precedences.
#' @format a \code{tbl_df} containing the following fields:
#' \describe{
#' \item{ucs}{}
#' \item{kFrequency}{}
#' \item{kTotalStrokes}{}
#' \item{kIICore}{}
#' \item{kUnihanCore2020}{}
#' \item{kJinmeiyoKanji}{}
#' \item{kJis0}{}
#' \item{kJis1}{}
#' \item{kJIS0213}{}
#' \item{kJoyoKanji}{}
#' \item{kMojiJoho}{}
#' }
#' @source The data comes from the XML Representation of Unicode 15.1.0 UCD flat file.
#' @seealso
#' \link{rnaco}
NULL
