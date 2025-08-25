<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Sudah di include di xsl lain -->
  <!-- <xsl:include href="title.xsl"/> -->
  <!-- <xsl:include href="listItem.xsl"/>  -->

  <xsl:template match="randomList">
    <ul>
      <xsl:apply-templates />
    </ul>         
  </xsl:template>  

</xsl:stylesheet>