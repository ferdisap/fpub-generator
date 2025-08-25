<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- CSS
    1. warna dari Merah paling secret hingga hijau paling unclassified
  -->

  <xsl:template match="security">    
    <div class="securityClassification">
      <xsl:call-template name="security"/>
      <xsl:choose>
        <xsl:when test="@securityClassification = '01'">
          <h1>Unclassified</h1>
        </xsl:when>
        <xsl:when test="@securityClassification = '02'">
          <h1>Restricted</h1>
        </xsl:when>
        <xsl:when test="@securityClassification = '03'">
          <h1>Confidential</h1>
        </xsl:when>
        <xsl:when test="@securityClassification = '04'">
          <h1>Secreet</h1>
        </xsl:when>
        <xsl:when test="@securityClassification = '05'">
          <h1>Top Secret</h1>
        </xsl:when>
        <xsl:otherwise>
          <h1>DEEP SECRET</h1>
        </xsl:otherwise>
      </xsl:choose>
    </div>      
  </xsl:template>

  <xsl:template name="security">
    <xsl:call-template name="securityClassification"/>
    <xsl:call-template name="commercialClassification"/>
    <xsl:call-template name="caveat"/>
    <xsl:call-template name="derivativeClassificationRefId"/>
  </xsl:template>

  <xsl:template name="securityClassification">
    <xsl:if test="@securityClassification">
      <xsl:attribute name="securityClassification">
        <xsl:value-of select="@securityClassification"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="commercialClassification">
    <xsl:if test="@commercialClassification">
      <xsl:attribute name="commercialClassification">
        <xsl:value-of select="@commercialClassification"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="caveat">
    <xsl:if test="@caveat">
      <xsl:attribute name="caveat">
        <xsl:value-of select="@caveat"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

  <xsl:template name="derivativeClassificationRefId">
    <xsl:if test="@derivativeClassificationRefId">
      <xsl:attribute name="derivativeClassificationRefId">
        <xsl:value-of select="@derivativeClassificationRefId"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>