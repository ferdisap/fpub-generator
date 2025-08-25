<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="shortName">
    <span class="shortName">
      <xsl:call-template name="changeAttribute"/>
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>