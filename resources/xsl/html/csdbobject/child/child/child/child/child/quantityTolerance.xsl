<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="quantityTolerance">
  <span class="quantityTolerance">
    <xsl:if test="@quantityToleranceType">
      <xsl:attribute name="quantityToleranceType"><xsl:value-of select="@quantityToleranceType"/></xsl:attribute>
      <span class="quantityToleranceType">
        <xsl:choose>
          <xsl:when test="@quantityToleranceType = 'plus'"><xsl:text>&#43;</xsl:text></xsl:when>
          <xsl:when test="@quantityToleranceType = 'minus'"><xsl:text>&#8722;</xsl:text></xsl:when>
          <xsl:when test="@quantityToleranceType = 'plusminus'"><xsl:text>&#177;</xsl:text></xsl:when>
        </xsl:choose>
      </span>
    </xsl:if>
    <xsl:apply-templates/>
    <span quantityUnitOfMeasure="{@quantityUnitOfMeasure | parent::quantityGroup/@quantityUnitOfMeasure}">
      <xsl:value-of select="@quantityUnitOfMeasure | parent::quantityGroup/@quantityUnitOfMeasure"/>
    </span>
  </span>
</xsl:template>

</xsl:stylesheet>