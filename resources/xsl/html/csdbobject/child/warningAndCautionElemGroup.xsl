<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:include href="./child/warningAndCaution.xsl" />

    <xsl:template name="warningRefs">
        <xsl:param name="id" select="@warningRefs"/>
        <xsl:if test="$id">
            <xsl:attribute name="warningRefs">
                <xsl:value-of select="@warningRefs"/>
            </xsl:attribute>
            <xsl:attribute name="idrefs">
                <xsl:value-of select="//warning[@id = $id]"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:template>

    <xsl:template name="cautionRefs">
        <xsl:param name="id" select="@cautioRefs"/>
        <xsl:if test="$id">
            <xsl:attribute name="cautioRefs">
                <xsl:value-of select="@cautioRefs"/>
            </xsl:attribute>
            <xsl:attribute name="idrefs">
                <xsl:value-of select="//caution[@id = $id]"/>
            </xsl:attribute>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>