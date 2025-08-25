<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="./child/manufacturerCode.xsl"/>
<xsl:include href="./child/partAndSerialNumber.xsl"/>
<xsl:include href="./child/refs.xsl"/>

  <xsl:template match="identNumber">
    <span class="identNumber">
      <xsl:call-template name="changeAttribute"/>
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>