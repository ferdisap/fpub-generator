<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- sudah di include di xsl lain -->
  <!-- <xsl:include href="captionLine.xsl"/> -->

  <!-- CSS
    1. caption class sama dengan "d-inline-flex justify-content-center align-items-center kalau di bootstrap"
    2. warna color mengacu pada ../mpub/src/Config/configurableValues.xml
  -->

    <xsl:template match="caption">
      <span class="caption">
        <xsl:if test="@color">
          <xsl:attribute name="color"><xsl:value-of select="@color"/></xsl:attribute>
        </xsl:if>

        <xsl:attribute name="style">
          <xsl:text>display:inline-flex;</xsl:text>
          <xsl:if test="@captionWidth">width:<xsl:value-of select="@captionWidth"/>;</xsl:if>
          <xsl:if test="@captionHeight">height:<xsl:value-of select="@captionHeight"/>;</xsl:if>
        </xsl:attribute>

        <xsl:apply-templates/>
      </span>
    </xsl:template>

</xsl:stylesheet>