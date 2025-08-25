<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

    <!-- sudah di include di xsl laint -->
    <!-- <xsl:include href="./child/symbol.xsl" /> -->

    <xsl:template match="warningsAndCautions">
        <div class="warningsAndCautions">
            <xsl:call-template name="changeAttribute"/>
            <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:call-template name="id"/>
            <xsl:call-template name="security"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="warning">
        <div class="warning">
            <xsl:call-template name="applicRefId"/>
            <xsl:call-template name="changeAttribute"/>
            <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:call-template name="id"/>
            <xsl:call-template name="security"/>
            <xsl:apply-templates select="symbol">
                <xsl:with-param name="useContainer">yes</xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates select="warningAndCautionPara"/>
        </div>
    </xsl:template>
    
    <xsl:template match="caution">
        <div class="caution">
            <xsl:call-template name="applicRefId"/>
            <xsl:call-template name="changeAttribute"/>
            <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:call-template name="id"/>
            <xsl:call-template name="security"/>
            <xsl:apply-templates select="symbol">
                <xsl:with-param name="useContainer">yes</xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates select="warningAndCautionPara"/>
        </div>
    </xsl:template>

    <xsl:template match="warningAndCautionPara">
        <p class="warningAndCautionPara">
            <xsl:call-template name="applicRefId"/>
            <xsl:call-template name="changeAttribute"/>
            <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:call-template name="id"/>
            <xsl:call-template name="security"/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>