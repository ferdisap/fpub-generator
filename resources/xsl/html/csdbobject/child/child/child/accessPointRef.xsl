<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- JS
    1. Kedepan, bisa clickable dan terhubung ke common repository (comrep). 
  -->

  <xsl:include href="./child/name.xsl"/>
  <xsl:include href="./child/shortName.xsl"/>

  <!-- sudah di include di file lain -->
  <!-- <xsl:include href="./child/refs.xsl"/> -->

  <!-- JS
    Ada tooltip untuk melihat zone di data module comrep, cari //zoneRepository/zoneSpec/zoneIdent[@zoneNumber = $zoneNumber] di data module dmStatus/repositorySourceDmIdent
  -->

  <!-- CSS 
    1. span.accessPointRef position is relative 
    2. span.accessPointNumber akan menjadi tooltip saat mouseover dan onclick. 
    3. span.accessPointNumber display akan block dan position relative
  -->

  <xsl:template match="accessPointRef">
    <span class="accessPointRef">
      <xsl:call-template name="id"/>
      <xsl:call-template name="changeAttribute"/>
      <xsl:call-template name="security"/>
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:if test="@accessPointTypeValue">
        <xsl:attribute name="accessPointTypeValue"><xsl:value-of select="@accessPointTypeValue"/></xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <xsl:when test="@lsarData">
          <xsl:attribute name="lsarData" select="@lsarData"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="lsarData" select="'0'"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:apply-templates/>
      <xsl:if test="@accessPointNumber">
        <span class="accessPointNumber">
          <xsl:value-of select="@accessPointNumber"/>
        </span>
      </xsl:if>
    </span>
  </xsl:template>

</xsl:stylesheet>