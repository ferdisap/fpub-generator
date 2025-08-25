<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="pmCode">
    <span class="pmCode">
      <xsl:value-of select="@modelIdentCode"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@pmIssuer"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@pmNumber"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@pmVolume"/>
    </span>
  </xsl:template>

</xsl:stylesheet>