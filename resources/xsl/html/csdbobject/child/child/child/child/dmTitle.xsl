<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/techName.xsl"/>
  <xsl:include href="./child/infoName.xsl"/>
  <xsl:include href="./child/infoNameVariant.xsl"/>

  <xsl:template match="dmTitle">
    <span class="dmTitle">
      <xsl:call-template name="security" />
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>