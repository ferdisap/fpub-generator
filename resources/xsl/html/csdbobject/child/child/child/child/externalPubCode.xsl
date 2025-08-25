<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Sudah di include di script lain -->
  <!-- <xsl:include href="indexFlag.xsl"/> -->
  <!-- <xsl:include href="subScript.xsl"/> -->
  <!-- <xsl:include href="superScript.xsl"/> -->
  <!-- <xsl:include href="acronym.xsl"/> -->
  <!-- <xsl:include href="acronymTerm.xsl"/> -->
  <!-- <xsl:include href="verbatimText.xsl"/> -->

  <xsl:template match="externalPubCode">
    <span class="externalPubCode">
      <xsl:if test="@pubCodingScheme">
        <xsl:value-of select="@pubCodingScheme"/>
        <xsl:text>:&#160;</xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>