<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/partNumber.xsl" />
  <xsl:include href="./child/serialNumber.xsl" />

  <!-- CSS
    1. text sedikit seperti ada didalam box padding kecil dan bershadow kecil
   -->
  <!-- JS
    1. Kedepannya nanti clickable dan terhubung ke IPD dan 3D model
  -->

  <xsl:template match="partAndSerialNumber">
    <span class="partAndSerialNumber">
      <xsl:call-template name="id" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="security" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:apply-templates selects="partNumber"/>
      <xsl:apply-templates selects="serialNumber"/>
    </span>
  </xsl:template>

</xsl:stylesheet>