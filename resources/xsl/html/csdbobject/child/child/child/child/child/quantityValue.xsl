<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="quantityValue">
  <span class="quantityValue">
    <xsl:apply-templates/>
    <xsl:text>&#32;</xsl:text>
    <span quantityUnitOfMeasure="{@quantityUnitOfMeasure | parent::quantityGroup/@quantityUnitOfMeasure}">
      <xsl:value-of select="@quantityUnitOfMeasure | parent::quantityGroup/@quantityUnitOfMeasure"/>
    </span>
  </span>
</xsl:template>

</xsl:stylesheet>