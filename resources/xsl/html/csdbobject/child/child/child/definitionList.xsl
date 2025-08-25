<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- <xsl:include href="title.xsl"/> -->
  <xsl:include href="./child/definitionListHeader.xsl"/> 
  <xsl:include href="./child/definitionListItem.xsl"/> 

  <xsl:template match="definitionList">
    <ul class="definitionList">
      <xsl:apply-templates select="title"/>
      <xsl:apply-templates select="definitionListHeader"/>
      <xsl:apply-templates select="definitionListItem"/>
    </ul>
  </xsl:template>

</xsl:stylesheet>