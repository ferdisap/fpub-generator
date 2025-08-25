<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/title.xsl"/>
  <xsl:include href="./child/listItem.xsl"/> 

  <xsl:template match="sequentialList">
    <ol>
      <xsl:apply-templates />
    </ol>         
  </xsl:template>  

</xsl:stylesheet>