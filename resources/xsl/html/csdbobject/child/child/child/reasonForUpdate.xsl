<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- sudah di include di xsl lain -->
<!-- <xsl:include href="./child/dmRef.xsl" />
<xsl:include href="./child/pmRef.xsl" />
<xsl:include href="./child/externalPubRef.xsl" /> -->

<xsl:template match="reasonForUpdate">
  <div class="reasonForUpdate">
    <xsl:call-template name="applicRefId"/>
    <xsl:call-template name="id"/>
    <xsl:call-template name="controlAuthorityRefs"/>
    <xsl:call-template name="updateReasonType"/>
    <xsl:call-template name="updateHighlight"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

<xsl:template name="updateReasonType">
<xsl:if test="@updateReasonType">
    <xsl:attribute name="updateReasonType">
      <xsl:value-of select="@updateReasonType"/>
    </xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:template name="updateHighlight">
  <xsl:if test="@updateHighlight">
    <xsl:attribute name="updateHighlight">
      <xsl:value-of select="@updateHighlight"/>
    </xsl:attribute>
  </xsl:if>
</xsl:template>

<xsl:template match="simpleRefPara">
  <div class="simpleRefPara">
    <xsl:call-template name="id"/>
    <xsl:call-template name="changeAttribute"/>
    <xsl:call-template name="controlAuthorityRefs"/>
    <xsl:call-template name="security"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>

</xsl:stylesheet>
