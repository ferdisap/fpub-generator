<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- sudah di include di xsl lain -->
  <!-- <xsl:include href="subScript.xsl"/> -->
  <!-- <xsl:include href="superScript.xsl"/> -->

  <xsl:template match="acronymDefinition">
    <span class="acronymDefinition">
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="id" />
      <xsl:call-template name="security" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>