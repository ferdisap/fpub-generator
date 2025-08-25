<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- CSS
    1. text berhuruf lebih kecil dari text paragraf.  
  -->

  <xsl:template match="manufacturerCode">
    <span class="manufacturerCode">
      <xsl:call-template name="id"/>
      <xsl:call-template name="changeAttribute"/>
      <xsl:call-template name="security"/>
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>