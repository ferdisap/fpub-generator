<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/acronymTerm.xsl"/>
  <xsl:include href="./child/acronymDefinition.xsl"/>

  <xsl:template match="acronym">
    <span class="acronym">
      <xsl:if test="@acronymType">
        <xsl:attribute name="acronymType">
          <xsl:value-of select="@acronymType"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="id" />
      <xsl:call-template name="security" />
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>