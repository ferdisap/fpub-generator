<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template name="controlAuthorityRefs">
    <xsl:if test="@controlAuthorityRefs">
      <xsl:attribute name="controlAuthorityRefs">
        <xsl:value-of select="@controlAuthorityRefs"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>