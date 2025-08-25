<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="applicRefId">
    <xsl:if test="@applicRefId">
      <xsl:attribute name="applicRefId">
        <xsl:value-of select="@applicRefId"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>