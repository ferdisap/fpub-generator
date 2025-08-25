<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Sudah di include di xsl lain -->
  <xsl:include href="./child/listItemTerm.xsl"/> 
  <xsl:include href="./child/listItemDefinition.xsl"/> 

  <xsl:template match="definitionListItem">
    <li class="definitionListItem">
      <xsl:apply-templates />
    </li>
  </xsl:template>

</xsl:stylesheet>