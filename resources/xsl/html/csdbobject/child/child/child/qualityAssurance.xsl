<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

  <xsl:template match="qualityAssurance">

    <div class="qualityAssurance">
      <xsl:call-template name="applicRefId"/>
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:apply-templates />
    </div>

  </xsl:template>

  <xsl:template match="unverified">
    <span class="unverified">unverified</span>
  </xsl:template>

  <xsl:template match="firstVerification">
    <div class="firstVerification">
      <xsl:value-of select="@verificationType"/>
    </div>
  </xsl:template>

  <xsl:template match="secondVerification">
    <div class="secondVerification">
      <xsl:value-of select="@verificationType"/>
    </div>
  </xsl:template>

</xsl:transform>