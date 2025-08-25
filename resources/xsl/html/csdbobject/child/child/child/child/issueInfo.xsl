<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="issueInfo">
    <span class="issueInfo">
      <xsl:value-of select="@issueNumber"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@inWork"/>
    </span>
  </xsl:template>

</xsl:stylesheet>