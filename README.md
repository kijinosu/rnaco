R implemention of NACO normalization
================
Alan Engel
08 July, 2024

The Library of Congress’s [Authority File Comparison Rules (NACO
Normalization)](https://www.loc.gov/aba/pcc/naco/normrule-2.html) were
finalized in 2009 for the specific purpose of determining whether or not
names in the 4XX fields can be added to the 1XX fields. If the
comparision rules find that a name in a 4XX field already exists, in
normalized form, in the 1XX fields, it cannot be added.\[Hickey, Toves,
and O’Neill ([2006](#ref-hickey2006naco))\]([Library of Congress,
Policy, Training, and Cooperative Programs Division
2020](#ref-loc2020descriptive))

Thanks to a splendid new R package, stringi, developed by Marek
Gagolewski,([Gagolewski 2022](#ref-R-stringi)) the comparison rules can
be implemented using calls to the ICU4C library from the [International
Components for Unicode](https://icu.unicode.org/). A step-by-step walk
through vignette shows how the comparison rules are executed using
stringi functions.

This package is a sibling of a [R package
viafr](https://github.com/kijinosu/viafr), which was forked from
Stefanie Schneider’s viafr package on Github.([Schneider
2022](#ref-R-viafr)) In a related project, viafr development is aimed at
extracting information, for example, social networks based on coauthors,
from the [Virtual International Authority Files
(VIAF)](https://viaf.org/). In particular, normalization functionality
for that package will be built and maintained in rnaco.

Of course, development based on NACO did not end in 2009 and is included
in the [NACO - Name Authority Cooperative
Program](https://www.loc.gov/aba/pcc/naco/index.html). This package is
intended to facilitate following developments and includes test datasets
from the [CJK NACO Project](https://www.loc.gov/aba/pcc/naco/CJK.html).
In particular, each build of the rnaco project downloads the following
files, which are then included as `tibbles`([Müller and Wickham
2023](#ref-R-tibble)) in package data.

# Features

## Functions

- naco_transform() This function follows the Authority File Comparison
  Rules using stringi([Gagolewski 2022](#ref-R-stringi)) to implement
  the [International Components for Unicode](https://icu.unicode.org/).
  The derivation of naco_transform() is detailed in a walk-through
  vignette, `rnaco::naco`.

- xml2df() This function reads a specially structured xml, and produces
  a tibble.

## Data

### MARC code tables

| Dataset                            | Description                                                                           |
|------------------------------------|---------------------------------------------------------------------------------------|
| marcNotes                          | Names, XPaths and notes for MARC-8 code tables                                        |
| marcBasicArabic                    | Basic Arabic code table, ISOcode=33 (July 2001)                                       |
| marcBasicCyrillic                  | Basic Cyrillic code table, ISOcode=4E (January 2000)                                  |
| marcBasicGreek                     | Basic Greek code table, ISOcode=53 (January 2000)                                     |
| marcBasicHebrew                    | Basic Hebrew code table, ISOcode=32 (January 2000)                                    |
| marcBasicLatinASCII                | Basic Latin (ASCII) code table (January 2000) ISOcode=42                              |
| marcComponentInputMethodCharacters | Component Input Method Characters code table (February 6, 2003)                       |
| marcEastAsianIdeographsHan         | East Asian Ideographs (‘Han’) code table (February 6, 2003)                           |
| marcEastAsianPunctuationMarks      | East Asian Punctuation Marks code table (February 6, 2003)                            |
| marcExtendedArabic                 | Extended Arabic code table, ISO code 34 (July 2001)                                   |
| marcExtendedCyrillic               | Extended Cyrillic code table, ISO code 51 (January 2000)                              |
| marcExtendedLatinANSEL             | Extended Latin (ANSEL) code table, ISO code 45 (January 2000, Updated September 2004) |
| marcGreekSymbols                   | Greek Symbols                                                                         |
| marcJapaneseHiraganaandKatakana    | Japanese Hiragana and Katakana code table (February 6, 2003)                          |
| marcKoreanHangul                   | Korean Hangul code table (February 6, 2003)                                           |
| marcSubscripts                     | Subscripts                                                                            |
| marcSuperscripts                   | Superscripts                                                                          |

### Datasets for naco_transform()

| Dataset               | Description                                         |
|-----------------------|-----------------------------------------------------|
| numericrules          | Transliteration rules for numeric decimals          |
| step6rulestring       | Transliteration rule for Step 6 of naco_transform() |
| step7lltranslitrule   | Transliteration rule for Step 7 of naco_transform() |
| unconditionalMappings | Unconditional mappings for naco_transform()         |

### Datasets for CJK normalization

| Dataset         | Description                                      |
|-----------------|--------------------------------------------------|
| unihan_variants | Unihan CJK variants                              |
| cjkextractja    | Personal name authority records - Japanese names |
| cjkextractko    | Personal name authority records - Korean names   |
| cjkextractzh    | Personal name authority records - Chinese names  |

## Vignettes

- MARC Tables for NACO: For each build, this script downloads the [MARC
  code lists](https://www.loc.gov/marc/) in XML format and extracts the
  code table listed above.

- rnaco::naco: Authority comparison (NACO) rules walk-through

- rnaco::nacoDatasets: Datasets for Authority File Comparison Rules
  (NACO Normalization)

- rnaco::unihanVariants: Unihan Variants Table for rnaco including
  analysis of their use in VAIF normalization of CJK names

# Installation

You can install the latest version of **rnaco** from
[github](https://github.com/kijinosu/rnaco) with:

``` r
library(devtools)
devtools::install_github("kijinosu/rnaco")
```

# Other simlar work

- [pynaco](https://github.com/unt-libraries/pynaco) is a fork by
  University of North Texas Libraries of sample code found on the OCLC
  Research Website.

# R packages used for this data package

- DataPackageR - Set up and put the pieces together ([Finak et al.
  2018](#ref-R-DataPackageR))

# References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-R-DataPackageR" class="csl-entry">

Finak, G, B Mayer, W Fulp, P Obrecht, A Sato, E Chung, D Holman, and R
Gottardo. 2018. “DataPackageR: Reproducible Data Preprocessing,
Standardization and Sharing Using r/Bioconductor for Collaborative Data
Analysis \[Version 2; Referees: 2 Approved, 1 Approved with
Reservations\].” *Gates Open Research* 2 (31).
<https://doi.org/10.12688/gatesopenres.12832.2>.

</div>

<div id="ref-R-stringi" class="csl-entry">

Gagolewski, Marek. 2022. “<span class="nocase">stringi</span>: Fast and
Portable Character String Processing in R.” *Journal of Statistical
Software* 103 (2): 1–59. <https://doi.org/10.18637/jss.v103.i02>.

</div>

<div id="ref-hickey2006naco" class="csl-entry">

Hickey, Thomas B., Jenny Toves, and T. O’Neill Edward. 2006. “NACO
Normalization: A Detailed Examination of the Authority File Comparison
Rules.” *Library Resources & Technical Services* 50 (3): 166–72.
<https://www.proquest.com/scholarly-journals/naco-normalization-detailed-examination-authority/docview/216890715/se-2>.

</div>

<div id="ref-loc2020descriptive" class="csl-entry">

Library of Congress, Policy, Training, and Cooperative Programs
Division. 2020. “Descriptive Cataloging Manual: Z1: Name and Series
Authority Records.” August 2020.
<https://www.loc.gov/aba/publications/FreeDCM/DCM/Z01.pdf>.

</div>

<div id="ref-R-tibble" class="csl-entry">

Müller, Kirill, and Hadley Wickham. 2023. *Tibble: Simple Data Frames*.
<https://CRAN.R-project.org/package=tibble>.

</div>

<div id="ref-R-viafr" class="csl-entry">

Schneider, Stefanie. 2022. *Viafr: Interface to the ’VIAF’ (’Virtual
International Authority File’) API*.
<https://CRAN.R-project.org/package=viafr>.

</div>

</div>
