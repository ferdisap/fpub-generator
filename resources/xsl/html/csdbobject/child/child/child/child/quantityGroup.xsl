<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="./child/quantityValue.xsl"/>
<xsl:include href="./child/quantityTolerance.xsl"/>

<xsl:template match="quantityGroup">
  <span class="quantityGroup">
    <xsl:if test="quantityUnitOfMeasure">
        <xsl:attribute name="quantityUnitOfMeasure"><xsl:value-of select="@quantityUnitOfMeasure"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@quantityGroupType">
      <span class="quantityGroupType">
        <xsl:attribute name="quantityGroupType"><xsl:value-of select="@quantityGroupType"/></xsl:attribute>
        <xsl:call-template name="quantityGroupType"/>
      </span>
    </xsl:if>
    <xsl:apply-templates/>
  </span>
</xsl:template>

<xsl:template name="quantityGroupType">
  <xsl:choose>
    <xsl:when test="@quantityGroupType = 'minimum'">
      <xsl:text>min.</xsl:text>
    </xsl:when>
    <xsl:when test="@quantityGroupType = 'maximum'">
      <xsl:text>max.</xsl:text>
    </xsl:when>
    <xsl:otherwise></xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>