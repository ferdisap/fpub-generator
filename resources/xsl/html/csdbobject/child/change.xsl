<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="changeAttribute">
    <xsl:call-template name="changeType"/>
    <xsl:call-template name="changeMark"/>
    <xsl:call-template name="reasonForUpdateRefIds"/>
  </xsl:template>

  <xsl:template name="changeType">
    <xsl:if test="@changeType">
      <xsl:attribute name="changeType">
        <xsl:value-of select="@changeType"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  <xsl:template name="changeMark">
    <xsl:if test="@changeMark">
      <xsl:attribute name="changeMark">
        <xsl:value-of select="@changeMark"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="reasonForUpdateRefIds">
    <xsl:if test="@reasonForUpdateRefIds">
      <xsl:attribute name="reasonForUpdateRefIds">
        <xsl:value-of select="@reasonForUpdateRefIds"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>