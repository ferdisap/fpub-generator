<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- Sudah di include di xsl lain -->
<!-- <xsl:include href="name.xsl"/>
<xsl:include href="shortName.xsl"/>
<xsl:include href="refs.xsl"/> -->

  <!-- JS
    Ada tooltip untuk melihat zone di data module comrep, cari //zoneRepository/zoneSpec/zoneIdent[@zoneNumber = $zoneNumber] di data module dmStatus/repositorySourceDmIdent
  -->

  <!-- CSS 
    1. span.zoneRef position is relative 
    2. span.zoneNumber akan menjadi tooltip saat mouseover dan onclick. 
    3. span.zoneNumber display akan block dan position relative
  -->

  <xsl:template match="zoneRef">
    <span class="zoneRef">
      <xsl:call-template name="id"/>
      <xsl:call-template name="changeAttribute"/>
      <xsl:call-template name="security"/>
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:apply-templates/>
      <xsl:choose>
        <xsl:when test="@lsarData">
          <xsl:attribute name="lsarData" select="@lsarData"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:attribute name="lsarData" select="'0'"/>
        </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="@zoneNumber">
        <span class="zoneNumber">
          <xsl:value-of select="@zoneNumber"/>
        </span>
      </xsl:if>
    </span>
  </xsl:template>

</xsl:stylesheet>