<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/externalPubRefIdent.xsl"/>
  <xsl:include href="./child/externalPubRefAddressItems.xsl"/>
  <xsl:include href="./child/behavior.xsl"/>


  <xsl:template match="externalPubRef">
    <!-- <span href="#{string(referredFragment)}"> -->
    <span>
      <xsl:call-template name="applicRefId" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="id" />
      <xsl:call-template name="security" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:apply-templates />
    </span>
  </xsl:template>

</xsl:stylesheet>