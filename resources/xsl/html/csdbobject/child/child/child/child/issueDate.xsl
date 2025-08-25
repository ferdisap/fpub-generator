<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- CSS
  1. sama seperti <externalPubIssueDate>
-->
<!-- JS 
   1. beri tooltip jika diperlukan untuk keterangan month yang angka menjadi nama bulan
-->

  <xsl:template match="issueDate">
    <span class="issueDate">
      <xsl:value-of select="@year"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@month"/>
      <xsl:text>-</xsl:text>
      <xsl:value-of select="@day"/>
    </span>
  </xsl:template>

</xsl:stylesheet>