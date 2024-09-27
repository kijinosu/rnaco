<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
           xmlns:xs="http://www.w3.org/2001/XMLSchema"
           xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
           xmlns:moji="urn:mojikiban:ipa:go:jp:MJShrinkMap"
            xmlns:foaf="http://xmlns.com/foaf/0.1/"
            xmlns:dct="http://purl.org/dc/terms/"
            xmlns:cc="http://creativecommons.org/ns#"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="urn:mojikiban:ipa:go:jp:MJShrinkMap MJShrinkMapSchema.1.0.0_20160815.xsd"
           exclude-result-prefixes="xs xsl foaf dct cc xsi moji"
version="1.0" type="text" >

<xsl:output method="xml" encoding="UTF-8" />

<xsl:key name="ucslookup" match="row" use="mjcode" />
<xsl:variable name="mjucsfile" select="document('mjucs.xml')" />

<xsl:key name="ranklookup" match="row" use="ucs" />
<xsl:variable name="mjpfile" select="document('mjprecedence.xml')" />

<!-- version 0.2.7, 2024-09-05 
    version 0.2.6, 2024-08-28
    version 0.2.5, 2024-08-19
    version 0.2.4, 2024-08-16
    version 0.2.3, 2024-08-13
    version 0.2.2, 2024-08-04
    version 0.2.1, 2024-08-04
    version 0.2, 2024-08-03 -->
<!--Ref:資料3 縮退マップについて https://moji.or.jp/wp-content/mojikiban/2015/09/20150925_5.pdf -->
<!-- Follow algorithm for finding replacement character:
    1. jisucs If JIS/UCS entry, that becomes replacement.
    2a. If 民二5202 element, that becomes replacement.
    2b. koseki Next, if replacement yet and there are Koseki entries, the replacement is one or
        more with minimum "hop" count, then
        - version 0.2.3: use ucs with minimum menkuten value, not minimum ucs value
        - version 0.2.6: select based on mjprecedence.xml
    2c. If no replacement yet and 民一2842 element, that becomes replacement.
    3a. (version 0.2.1- omit)moj582 Next, if none of above but there are MOJ 582, part 1 entries, select highest ranking entry. 
    3b. (version 0.2.1- omit)moj582 Next, if none of above but there are MOJ 582, part 2 entries, 
        select highest ranking entry. 
    4. If none of above, do not replace character. 
    
For from-to edges: 
    (version 0.2.2) Do not write from/to rows if no replacement
    1) The 'to' value is the replacement or, if no replacement, the ucs for that MJ character. 
    2) For all ucs values in 縮退候補情報 element that are not identical to 'to' value, output
        as a 'from' value. (version 0.2.1- omit moj582)
        version 0.2.4: do only for dictionary sources
        version 0.2.7: add back except for moj582sec
    -->

<xsl:template match="moji:MJ縮退マップ" >
    <mjsedges>
        <xsl:apply-templates select="moji:縮退候補情報" />
    </mjsedges>
</xsl:template>

<xsl:template match="moji:縮退候補情報">
    <xsl:variable name="mjcode" >
        <xsl:value-of select="moji:MJ文字図形名" />
    </xsl:variable>
    <!-- Get the ucs code for this mjcode-->
    <xsl:variable name="ucsval">
        <xsl:value-of select="$mjucsfile/mjucs/row[@mj = $mjcode]/ucs" />
    </xsl:variable>
    <xsl:variable name="replacement">
        <xsl:apply-templates select="." mode="getreplacement" />
    </xsl:variable>
    <!-- if no replacement found, use ucsval as 'to' value.-->
    <xsl:variable name="tovalue" >
        <xsl:choose>
            <xsl:when test="string-length($replacement) = 0" >
                <xsl:value-of select="$ucsval" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$replacement" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <!-- if replacement, write row from ucsval to tovalue-->
    <xsl:if test="$ucsval != $tovalue" >
        <row>
            <mjcode ct="character"><xsl:value-of select="$mjcode" /></mjcode>
            <from ct="character"><xsl:value-of select="$ucsval" /></from>
            <to ct="character"><xsl:value-of select="$tovalue" /></to>
            <relation ct="character"><xsl:value-of select="'replaceducs'" /></relation>
        </row>

        <!-- for all ucs codes in element, create a 'from' element
                version 0.2.4: do only for dictionary sources -->
                
        <xsl:for-each select=".//moji:法務省戸籍法関連通達-通知/moji:戸籍統一文字情報_親字-正字//moji:対応UCS" >
            <xsl:if test=". != $tovalue" >
                <row>
                    <mjcode ct="character"><xsl:value-of select="$mjcode" /></mjcode>
                    <from ct="character"><xsl:value-of select="." /></from>
                    <to ct="character"><xsl:value-of select="$tovalue" /></to>
                    <relation ct="character"><xsl:value-of select="'koseki'" /></relation>
                </row>
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select=".//moji:法務省戸籍法関連通達-通知/moji:民二5202号通知別表_正字-俗字等対照表//moji:対応UCS" >
            <xsl:if test=". != $tovalue" >
                <row>
                    <mjcode ct="character"><xsl:value-of select="$mjcode" /></mjcode>
                    <from ct="character"><xsl:value-of select="." /></from>
                    <to ct="character"><xsl:value-of select="$tovalue" /></to>
                    <relation ct="character"><xsl:value-of select="'minni5202'" /></relation>
                </row>
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select=".//moji:法務省戸籍法関連通達-通知/moji:民一2842号通達別表_誤字俗字-正字一覧表//moji:対応UCS" >
            <xsl:if test=". != $tovalue" >
                <row>
                    <mjcode ct="character"><xsl:value-of select="$mjcode" /></mjcode>
                    <from ct="character"><xsl:value-of select="." /></from>
                    <to ct="character"><xsl:value-of select="$tovalue" /></to>
                    <relation ct="character"><xsl:value-of select="'minichi2842'" /></relation>
                </row>
            </xsl:if>
        </xsl:for-each>
        <xsl:for-each select=".//moji:法務省告示582号別表第四//moji:表その一//moji:対応UCS" >
            <xsl:if test=". != $tovalue" >
                <row>
                    <mjcode ct="character"><xsl:value-of select="$mjcode" /></mjcode>
                    <from ct="character"><xsl:value-of select="." /></from>
                    <to ct="character"><xsl:value-of select="$tovalue" /></to>
                    <relation ct="character"><xsl:value-of select="'moj582pri'" /></relation>
                </row>
            </xsl:if>
        </xsl:for-each>
        <!--
        <xsl:for-each select=".//moji:法務省告示582号別表第四//moji:表その二//moji:対応UCS" >
            <xsl:if test=". != $tovalue" >
                <row>
                    <mjcode ct="character"><xsl:value-of select="$mjcode" /></mjcode>
                    <from ct="character"><xsl:value-of select="." /></from>
                    <to ct="character"><xsl:value-of select="$tovalue" /></to>
                    <relation ct="character"><xsl:value-of select="'moj582sec'" /></relation>
                </row>
            </xsl:if>
        </xsl:for-each>-->
        <xsl:for-each select=".//moji:辞書類等による関連字//moji:対応UCS" >
            <xsl:if test=". != $tovalue" >
                <row>
                    <mjcode ct="character"><xsl:value-of select="$mjcode" /></mjcode>
                    <from ct="character"><xsl:value-of select="." /></from>
                    <to ct="character"><xsl:value-of select="$tovalue" /></to>
                    <relation ct="character"><xsl:value-of select="'dictionary'" /></relation>
                </row>
            </xsl:if>
        </xsl:for-each>
    </xsl:if>
</xsl:template>

<xsl:template match="moji:縮退候補情報" mode="getreplacement">
    <xsl:variable name="mjcode" >
        <xsl:value-of select="moji:MJ文字図形名" />
    </xsl:variable>
        <xsl:choose>
            <xsl:when test="moji:JIS包摂規準-UCS統合規則" >
                    <xsl:value-of select=".//moji:対応UCS" />
            </xsl:when>
            <xsl:when test="moji:法務省戸籍法関連通達-通知" >
                <xsl:apply-templates select="moji:法務省戸籍法関連通達-通知" mode="getreplacement" />
            </xsl:when>
            <xsl:when test="moji:法務省告示582号別表第四/moji:表その一" >
                <xsl:call-template name="getmoj582replacement1" />
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
</xsl:template>

<xsl:template match="moji:法務省戸籍法関連通達-通知" mode="getreplacement" >
    <xsl:choose>
        <xsl:when test="moji:民二5202号通知別表_正字-俗字等対照表" >
            <xsl:value-of select=".//moji:対応UCS" />
        </xsl:when>
        <!-- This algorithm calls for the minimum hop count. If there are multiple elements
        at the minimum hop count, compute a rank consisting of grade level, stroke count, 
        and dehyphenated menkuten value. Choose ucs with minimum rank.-->
        <xsl:when test="moji:戸籍統一文字情報_親字-正字" >
            <xsl:variable name="minhops" >
                <xsl:call-template name="getminhops" >
                    <xsl:with-param name="hops" select="moji:戸籍統一文字情報_親字-正字" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="minrank" >
                <xsl:call-template name="getminrank" >
                    <xsl:with-param name="ucsset" select="./moji:戸籍統一文字情報_親字-正字[number(@ホップ数) = $minhops]/moji:JIS_X_0213情報" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="jistree" select="./moji:戸籍統一文字情報_親字-正字[number(@ホップ数) = $minhops]/moji:JIS_X_0213情報" />
            <xsl:for-each select="$jistree" >
                <xsl:variable name="ucsval" select="moji:対応UCS" />
                <xsl:variable name="jisval" select="moji:面区点位置" />
                <xsl:variable name="thisrank">
                    <xsl:call-template name="getfullrank" >
                        <xsl:with-param name="ucslocal" select="$ucsval" />
                        <xsl:with-param name="jiswhole" select="$jisval" />
                    </xsl:call-template>
                </xsl:variable>
                <xsl:if test="$thisrank = $minrank" >
                    <xsl:value-of select="$ucsval"/>
                    <!--<xsl:value-of select="concat($thisrank, '/',$ucsval)" />-->
                </xsl:if>
            </xsl:for-each>
        </xsl:when>
        <xsl:when test="moji:民一2842号通達別表_誤字俗字-正字一覧表" >
            <xsl:value-of select=".//moji:対応UCS" />
        </xsl:when>
        <xsl:otherwise />
    </xsl:choose>
</xsl:template>

<xsl:template name="getrank">
    <xsl:param name="ucs" />
    <xsl:for-each select="$mjpfile">
        <xsl:variable name="ucsrank" select="key('ranklookup', $getucs)" />
        <xsl:value-of select="$ucsrank/rank" />
    </xsl:for-each>    
    <!--<xsl:value-of select="($mjpfile/mjr/row)[@ucs = $getucs]/@rank" />-->
</xsl:template>

<xsl:template name="getfullrank">
    <xsl:param name="ucslocal" />
    <xsl:param name="jiswhole" />
    <xsl:variable name="jislocal" select="translate($jiswhole,'-','')"/>
    <xsl:variable name="rankup" >
        <xsl:for-each select="$mjpfile" >
            <xsl:variable name="rankval" select="key('ranklookup', $ucslocal)/rank" />
            <xsl:variable name="strokeval" select="key('ranklookup', $ucslocal)/strokes" />
            <xsl:value-of select="number($rankval) * 100 + number($strokeval)" />
        </xsl:for-each>
    </xsl:variable>
    <xsl:value-of select="$rankup * 100000 + number($jislocal)" />
</xsl:template>

<!-- Select minimum rank value -->
<xsl:template name="getminrank">
    <xsl:param name="ucsset" />
    <xsl:choose>
        <xsl:when test="$ucsset" >
           <xsl:variable name="firstrank" >
                <xsl:call-template name="getfullrank" >
                    <xsl:with-param name="ucslocal" select="$ucsset[1]/moji:対応UCS" />
                    <xsl:with-param name="jiswhole" select="$ucsset[1]/moji:面区点位置" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="min-of-rest" >
                <xsl:call-template name="getminrank" >
                    <xsl:with-param name="ucsset" select="$ucsset[position()!=1]" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$firstrank &lt; $min-of-rest">
                    <xsl:value-of select="$firstrank" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$min-of-rest" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:otherwise>99999999</xsl:otherwise>
    </xsl:choose>
</xsl:template>

<!-- Select minimum hop value -->
<xsl:template name="getminhops">
    <xsl:param name="hops" />
    <xsl:for-each select="$hops">
        <xsl:sort select="number(@ホップ数)" data-type="number" />
        <xsl:if test="position() =1"><xsl:value-of select="number(@ホップ数)" /></xsl:if>
    </xsl:for-each>
</xsl:template>


<xsl:template match="moji:JIS_X_0213情報" mode="rankmenkuten" >
    <xsl:variable name="jprank" >
        <xsl:call-template name="getrank">
            <xsl:with-param name="getucs" select="moji:対応UCS" />
        </xsl:call-template>
        <xsl:value-of select="translate(moji:面区点位置,'-','')" />
    </xsl:variable>
    <rank><xsl:value-of select="$jprank" /></rank>
</xsl:template>

<xsl:template match="moji:戸籍統一文字情報_親字-正字" mode="minmenkuten">
                <xsl:variable name="mojiucs" >
                    <xsl:value-of select=".//moji:対応UCS" />
                </xsl:variable>
                <xsl:variable name="jrank" >
                    <xsl:call-template name="getrank">
                        <xsl:with-param name="getucs" select="$mojiucs" />
                    </xsl:call-template> 
                </xsl:variable>
    <!--<xsl:value-of select="concat(@ホップ数, $jrank)" /><xsl:text>:</xsl:text>-->
    <xsl:value-of select="$mojiucs"/><xsl:text>/</xsl:text>
</xsl:template>


<!-- Select minimum ucs value -->
<xsl:template name="selectminucs">
    <xsl:param name="ucslist" />
    <xsl:for-each select="$ucslist">
        <xsl:sort select="." />
        <xsl:if test="position() =1"><xsl:value-of select="." /></xsl:if>
    </xsl:for-each>
</xsl:template>

<xsl:template name="getmoj582replacement1">
    <xsl:choose>
        <xsl:when test=".//moji:表その一/moji:第1順位//moji:対応UCS" >
            <xsl:value-of select=".//moji:第1順位//moji:対応UCS" />
        </xsl:when>
        <xsl:when test=".//moji:表その一/moji:第2順位//moji:対応UCS" >
            <xsl:value-of select=".//moji:第2順位//moji:対応UCS" />
        </xsl:when>
        <xsl:otherwise />
    </xsl:choose>
</xsl:template>

<xsl:template name="getmoj582replacement2">
    <xsl:choose>
        <xsl:when test=".//moji:表その二/moji:第1順位//moji:対応UCS" >
            <xsl:value-of select=".//moji:第1順位//moji:対応UCS" />
        </xsl:when>
        <xsl:when test=".//moji:表その二/moji:第2順位//moji:対応UCS" >
            <xsl:value-of select=".//moji:第2順位//moji:対応UCS" />
        </xsl:when>
        <xsl:otherwise />
    </xsl:choose>
</xsl:template>

<xsl:template name="getucs">
    <xsl:param name="getcode" />
    <xsl:for-each select="$mjucsfile">
        <xsl:variable name="mjrow" select="key('ucslookup', $getcode)" />
        <xsl:value-of select="$mjrow/ucs" />
    </xsl:for-each>
    <!--<xsl:value-of select="$getcode" /><xsl:value-of select="$mjucsfile/mjucs/row[@mj = $getcode]/ucs" />-->
</xsl:template>

<xsl:template name="getstrokes">
    <xsl:param name="getucs" />
    <xsl:value-of select="$mjucsfile/mjucs/row[@u = $getucs]/strokes" />
</xsl:template>

</xsl:stylesheet>
