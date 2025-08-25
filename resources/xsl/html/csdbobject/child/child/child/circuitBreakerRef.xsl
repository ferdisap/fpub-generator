<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- sudah di include di xsl lain -->
  <!-- <xsl:include href="name.xsl"/> -->
  <!-- <xsl:include href="shortName.xsl"/> -->
  <!-- <xsl:include href="refs.xsl"/> -->

  <!-- JS
    Ada tooltip untuk melihat zone di data module comrep, cari //zoneRepository/zoneSpec/zoneIdent[@zoneNumber = $zoneNumber] di data module dmStatus/repositorySourceDmIdent
  -->

  <!-- CSS 
    1. span.accessPointRef position is relative 
    2. span.accessPointNumber akan menjadi tooltip saat mouseover dan onclick. 
    3. span.accessPointNumber display akan block dan position relative
  -->

  <xsl:template match="circuitBreakerRef">
    <span class="circuitBreakerRef">
      <xsl:call-template name="applicRefId" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:call-template name="id" />
      <xsl:call-template name="security" />
      <xsl:if test="circuitBreakerType">
        <xsl:attribute name="circuitBreakerType"><xsl:value-of select="@circuitBreakerType" /></xsl:attribute>
      </xsl:if>
      <xsl:if test="circuitBreakerAction">
        <xsl:attribute name="circuitBreakerAction"><xsl:value-of select="@circuitBreakerAction" /></xsl:attribute>
      </xsl:if>
      <xsl:if test="checkSum">
        <xsl:attribute name="checkSum"><xsl:value-of select="@checkSum" /></xsl:attribute>
      </xsl:if>
      <xsl:if test="installationIdent">
        <xsl:attribute name="installationIdent"><xsl:value-of select="@installationIdent" /></xsl:attribute>
      </xsl:if>
      <xsl:if test="contextIdent">
        <xsl:attribute name="contextIdent"><xsl:value-of select="@contextIdent" /></xsl:attribute>
      </xsl:if>
      <xsl:if test="manufacturerCodeValue">
        <xsl:attribute name="manufacturerCodeValue"><xsl:value-of select="@manufacturerCodeValue" /></xsl:attribute>
      </xsl:if>
      <xsl:if test="itemOriginator">
        <xsl:attribute name="itemOriginator"><xsl:value-of select="@itemOriginator" /></xsl:attribute>
      </xsl:if>
      <xsl:apply-templates />
      <xsl:if test="@circuitBreakerNumber">
        <span class="circuitBreakerNumber">
          <xsl:value-of select="@circuitBreakerNumber" />
        </span>
      </xsl:if>
    </span>
  </xsl:template>

</xsl:stylesheet>