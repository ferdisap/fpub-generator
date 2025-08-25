<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="symbol">
    <xsl:param name="useContainer" select="no"/>
    <xsl:choose>
      <xsl:when test="$useContainer = 'yes'">
        <div class="symbol-container">
          <xsl:call-template name="symbol"/>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="symbol"/>
      </xsl:otherwise>
    </xsl:choose>    
  </xsl:template>

  <xsl:template name="symbol">
    <img class="symbol" src="{@infoEntityIdent}">
      <xsl:if test="@id">
        <xsl:attribute name="id">
          <xsl:value-of select="@id"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@reproductionWidth">
        <xsl:attribute name="width">
          <xsl:value-of select="@reproductionWidth"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@reproductionHeight">
        <xsl:attribute name="height">
          <xsl:value-of select="@reproductionHeight"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="@reproductionScale">
        <xsl:attribute name="scale">
          <xsl:value-of select="@reproductionScale"/>
        </xsl:attribute>
      </xsl:if>

      <xsl:call-template name="applicRefId"/>
      <xsl:call-template name="controlAuthorityRefs"/>
    </img>
  </xsl:template>

</xsl:stylesheet>