<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="symbol.xsl"/> -->
    <!-- <xsl:include href="dmRef.xsl"/> -->
    <!-- <xsl:include href="para.xsl"/> -->

    <xsl:template match="controlAuthorityGroup">
        <div class="controlAuthorityGroup">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="id" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="security" />
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="controlAuthority">
        <div class="controlAuthority">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="id" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="security" />
            <div class="symbol">
                <xsl:apply-templates select="symbol"/>
            </div>
            <xsl:apply-templates select="dmRef | controlAuthorityText"/>
        </div>
    </xsl:template>

    <xsl:template match="controlAuthorityText">
        <div class="controlAuthorityText">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

</xsl:stylesheet>