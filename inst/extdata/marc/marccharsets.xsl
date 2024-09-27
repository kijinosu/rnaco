<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
           xmlns:xs="http://www.w3.org/2001/XMLSchema"
           xmlns:xsl = "http://www.w3.org/1999/XSL/Transform"
           exclude-result-prefixes="xs"
version="1.0" type="text" >

<xsl:output method="xml" encoding="UTF-8" />

<xsl:template match="characterSet">
    <xsl:choose>
        <xsl:when test="grouping">
            <xsl:apply-templates select="grouping" />
        </xsl:when>
        <xsl:otherwise>
            <xsl:variable name="mname">
                <xsl:call-template name="makemarcname">
                    <xsl:with-param name="premarc" ><xsl:value-of select="@name" /></xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            <xsl:element name="{$mname}">
                <xsl:apply-templates select="code" />
            </xsl:element>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

<xsl:template match="grouping">
    <xsl:variable name="mname">
        <xsl:call-template name="makemarcname">
            <xsl:with-param name="premarc" ><xsl:value-of select="@name" /></xsl:with-param>
        </xsl:call-template>
    </xsl:variable>
    <xsl:element name="{$mname}">
        <xsl:apply-templates select="code" />
    </xsl:element>
</xsl:template>

<xsl:template match="code">
    <xsl:variable name="testucs">
        <xsl:value-of select="normalize-space(ucs)" />
    </xsl:variable>
    <xsl:variable name="testutf8">
        <xsl:choose>
            <xsl:when test="utf-8/text()" >
                <xsl:value-of select="normalize-space(utf-8)" />
            </xsl:when>
            <xsl:otherwise>NA</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:if test="string-length($testucs) &gt; 0">
    <row>
        <marc ct="character"><xsl:value-of select="marc"/></marc>
        <ucs ct="character"><xsl:value-of select="concat('0x',ucs)"/></ucs>
        <utf8 ct="character"><xsl:value-of select="$testutf8"/></utf8>
        <isAlt ct="logical"></isAlt>
        <isCombining ct="logical"><xsl:value-of select="isCombining"/></isCombining>
        <name ct="character"><xsl:value-of select="name"/></name>
    </row>
    </xsl:if>
    <xsl:if test="alt">
    <row>
        <marc ct="character"><xsl:value-of select="marc"/></marc>
        <ucs ct="character"><xsl:value-of select="concat('0x',alt)"/></ucs>
        <utf8 ct="character"><xsl:value-of select="altutf-8"/></utf8>
        <isAlt ct="logical">true</isAlt>
        <isCombining ct="logical"><xsl:value-of select="isCombining"/></isCombining>
        <name ct="character"><xsl:value-of select="name"/></name>
    </row>
    </xsl:if>
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