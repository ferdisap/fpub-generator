<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="enterpriseName.xsl"/>

  <!-- CSS
    1. display block,
  -->

  <xsl:template match="responsiblePartnerCompany">
    <xsl:param name="useTitle" select="boolean(1)"/>
    <xsl:if test="enterpriseName or @enterpriseCode">
      <div class="responsiblePartnerCompany">
        <xsl:call-template name="id"/>
        <xsl:if test="$useTitle">
          <h1>Responsible Company</h1>
        </xsl:if>
        <xsl:if test="@enterpriseCode">
          <div class="enterpriseCode">
            <xsl:text>CAGE: </xsl:text>
            <xsl:value-of select="@enterpriseCode"/>
          </div>
        </xsl:if>
        <xsl:if test="enterpriseName">
          <div class="enterpriseName">
            <xsl:value-of select="enterpriseName"/>
          </div>
        </xsl:if>
      </div>
    </xsl:if>
  </xsl:template>

  <xsl:template match="originator">
    <xsl:param name="useTitle" select="boolean(1)"/>
    <xsl:if test="enterpriseName or @enterpriseCode">
      <div class="originator">
        <xsl:call-template name="id"/>
        <xsl:if test="$useTitle">
          <h1>Originator</h1>
        </xsl:if>
        <xsl:if test="@enterpriseCode">
          <div class="enterpriseCode">
            <xsl:text>CAGE: </xsl:text>
            <xsl:value-of select="@enterpriseCode"/>
          </div>
        </xsl:if>
        <xsl:if test="enterpriseName">
          <div class="enterpriseName">
            <xsl:value-of select="enterpriseName"/>
          </div>
        </xsl:if>
      </div>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>