<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- CSS dan JS
   1. sama seperti <issueDate>
    -->

  <xsl:template match="externalPubIssueDate">
    <span class="externalPubIssueDate">
      <xsl:value-of select="@year"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@month"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@day"/>
    </span>
  </xsl:template>

</xsl:stylesheet>