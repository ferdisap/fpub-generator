<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="id">
    <xsl:param name="id" select="@id"/>
    <xsl:choose>
      <xsl:when test="$id">
        <xsl:attribute name="id">
          <xsl:value-of select="$id"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="id">
          <xsl:value-of select="generate-id(.)"/>
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
    <!-- <xsl:if test="$id">
      <xsl:attribute name="id">
        <xsl:value-of select="$id"/>
      </xsl:attribute>
    </xsl:if> -->
  </xsl:template>

</xsl:stylesheet>