<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="footnoteRef">
    <xsl:call-template name="footnoteRef" />
  </xsl:template>

  <xsl:template name="footnoteRef">
    <xsl:param name="internalRefId" select="string(@internalRefId)" />
    <xsl:param name="mark">
      <xsl:for-each select="//*[string(@id) = $internalRefId]">
        <xsl:number level="any" />
      </xsl:for-each>
    </xsl:param>
    <a href="#{$internalRefId}" class="footnoteRef">
      <xsl:call-template name="internalRefId">
        <xsl:with-param name="internalRefId" select="$internalRefId"/>
      </xsl:call-template>
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:call-template name="changeAttribute" />
      <sup><xsl:value-of select="$mark"/></sup>
    </a>
  </xsl:template>

</xsl:stylesheet>