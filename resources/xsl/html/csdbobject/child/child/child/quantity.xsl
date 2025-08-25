<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="./child/quantityGroup.xsl"/>

<xsl:template match="quantity">
  <span class="quantity">
    <xsl:call-template name="changeAttribute"/>
    <xsl:call-template name="controlAuthorityRefs"/>
    <xsl:if test="quantityType">
      <xsl:attribute name="quantityType"><xsl:value-of select="@quantityType"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="quantityTypeSpecifics">
      <xsl:attribute name="quantityTypeSpecifics"><xsl:value-of select="@quantityTypeSpecifics"/></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates/>
  </span>
</xsl:template>

</xsl:stylesheet>