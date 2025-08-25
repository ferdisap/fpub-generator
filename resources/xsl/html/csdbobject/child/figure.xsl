<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./child/title.xsl" /> -->

    <xsl:include href="./child/graphic.xsl" />

    <!-- CSS
        1. figure must be in center of display area 
    -->

    <xsl:template match="figureAlts">
        <div class="figureAlts">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="figure">
        <figure class="figure">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:apply-templates select="*[local-name() != 'title']"/>
            <xsl:apply-templates select="title">
                <xsl:with-param name="titleLevel">
                    <xsl:number count="figure" />
                </xsl:with-param>
            </xsl:apply-templates>
        </figure>
    </xsl:template>
</xsl:stylesheet>