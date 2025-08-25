<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- cuma ROOT (container.xsl) yang bisa include -->

  <xsl:include href="./child/dmAddress.xsl"/>
  <xsl:include href="./child/dmStatus.xsl"/>
  <xsl:include href="./child/pmAddress.xsl"/>
  <xsl:include href="./child/pmStatus.xsl"/>


  <xsl:template match="identAndStatusSection">
    <div class="identAndStatusSection">
      <!-- Ident and Status Section -->
      <xsl:apply-templates select="dmAddress"/>
      <xsl:apply-templates select="dmStatus"/>
    </div>    
  </xsl:template>

</xsl:stylesheet>