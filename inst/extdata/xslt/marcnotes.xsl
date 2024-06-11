<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
           xmlns:xs="http://www.w3.org/2001/XMLSchema"
           xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
           exclude-result-prefixes="xs"
version="1.0" type="text" >

<xsl:output method="xml" encoding="UTF-8" />

<xsl:template match="codeTables">
    <xsl:variable name="xpath">
        <xsl:value-of select="concat('/',name(),'[',position(),']')" />
    </xsl:variable>
    <marcNotes>
    <xsl:apply-templates select="codeTable">
        <xsl:with-param name="xpath" ><xsl:value-of select="$xpath" /></xsl:with-param>
    </xsl:apply-templates>
    </marcNotes>
</xsl:template>

<xsl:template match="codeTable" >
    <xsl:param name="xpath" />
    <xsl:variable name="catpath">
        <xsl:value-of select="concat($xpath,'/',name(),'[',position(),']')" />
    </xsl:variable>
    <xsl:variable name="notetext">
        <xsl:apply-templates select="note" />
    </xsl:variable>
    <xsl:apply-templates select="characterSet" >
        <xsl:with-param name="xpath" ><xsl:value-of select="$catpath" /></xsl:with-param>
        <xsl:with-param name="topnote"><xsl:value-of select="$notetext" /></xsl:with-param>
    </xsl:apply-templates> 
</xsl:template>

<xsl:template match="characterSet">
    <xsl:param name="xpath" />
    <xsl:param name="topnote" />
    <xsl:variable name="mname">
        <xsl:call-template name="makemarcname">
            <xsl:with-param name="premarc" ><xsl:value-of select="@name" /></xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="catpath">
        <xsl:value-of select="concat($xpath,'/',name(),'[',position(),']')" />
    </xsl:variable>
    <xsl:variable name="notes"><xsl:value-of select="$topnote" />
        <xsl:apply-templates select="note" />
    </xsl:variable>
    <xsl:choose>
        <xsl:when test="grouping">
            <xsl:apply-templates select="grouping">
                <xsl:with-param name="xpath" ><xsl:value-of select="$catpath" /></xsl:with-param>
                <xsl:with-param name="topnote"><xsl:value-of select="$notes" /></xsl:with-param>
            </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
        <row>
            <marcName ct="character"><xsl:value-of select="$mname" /></marcName>
            <marcPath ct="character"><xsl:value-of select="$catpath" /></marcPath>
            <marcNote ct="character"><xsl:value-of select="normalize-space($notes)" /></marcNote>
        </row>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="grouping">
    <xsl:param name="xpath" />
    <xsl:param name="topnote" />
    <xsl:variable name="mname">
        <xsl:call-template name="makemarcname">
            <xsl:with-param name="premarc" ><xsl:value-of select="@name" /></xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    <xsl:variable name="catpath">
        <xsl:value-of select="concat($xpath,'/',name(),'[',position(),']')" />
    </xsl:variable>
    <xsl:variable name="notes"><xsl:value-of select="$topnote" />
        <xsl:apply-templates select="note" />
    </xsl:variable>
    <row>
        <marcName ct="character"><xsl:value-of select="$mname" /></marcName>
        <marcPath ct="character"><xsl:value-of select="$catpath" /></marcPath>
        <marcNote ct="character"><xsl:value-of select="normalize-space($notes)" /></marcNote>
    </row>
</xsl:template>

<xsl:template match="note" >
    <xsl:variable name="rawtext">
        <xsl:choose>
            <xsl:when test="p" ><xsl:apply-templates select="p" /></xsl:when>
            <xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:choose>
        <xsl:when test="position() &gt; 1" ><xsl:text> </xsl:text><xsl:value-of select="$rawtext" /></xsl:when>
        <xsl:otherwise><xsl:value-of select="$rawtext" /></xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="p">
    <xsl:choose>
        <xsl:when test="position() &gt; 1" ><xsl:text> </xsl:text><xsl:value-of select="." /></xsl:when>
        <xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template name="makemarcname">
    <xsl:param name="premarc" />
    <xsl:variable name="apos">'</xsl:variable>
    <xsl:variable name="mname">
        <xsl:value-of select="concat('marc',translate($premarc, ' ', ''))" />
    </xsl:variable>
    <xsl:variable name="mname2">
        <xsl:value-of select="translate($mname, $apos, '')" />
    </xsl:variable>
    <xsl:value-of select="translate($mname2, '&#x28;&#x29;', '')" />
</xsl:template>

</xsl:stylesheet>