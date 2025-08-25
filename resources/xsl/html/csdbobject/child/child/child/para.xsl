<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- sudah di include di xsl lain -->
  <!-- <xsl:include href="textElemGroupStyle.xsl"/> -->

  <xsl:template match="para">
    <xsl:variable name="parentName" select="local-name(parent::*)" />
    <xsl:variable name="elementName">
      <xsl:choose>
        <xsl:when test="$parentName = 'footnote'"><xsl:text>span</xsl:text></xsl:when>
        <xsl:otherwise><xsl:text>p</xsl:text></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:element  name="{$elementName}">
      <xsl:call-template name="applicRefId" />
      <xsl:call-template name="id" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="security" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:attribute name="class"><xsl:text>para</xsl:text></xsl:attribute>
      <xsl:apply-templates />
    </xsl:element>
  </xsl:template>

  <!-- <xsl:template match="para">
    <xsl:choose>
      <xsl:when test="name(parent::*) = 'listItem'">
        <span class="para">
          <xsl:call-template name="applicRefId" />
          <xsl:call-template name="id" />
          <xsl:call-template name="changeAttribute" />
          <xsl:call-template name="security" />
          <xsl:call-template name="controlAuthorityRefs" />
          <xsl:apply-templates />
        </span>
      </xsl:when>
      <xsl:when test="name(child::*) = 'randomList'">
        <p class="para mb-0">
          <xsl:call-template name="applicRefId" />
          <xsl:call-template name="id" />
          <xsl:call-template name="changeAttribute" />
          <xsl:call-template name="security" />
          <xsl:call-template name="controlAuthorityRefs" />
          <xsl:apply-templates />
        </p>
      </xsl:when>
      <xsl:otherwise>
        <p class="para">
          <xsl:apply-templates />
        </p>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template> -->

</xsl:stylesheet>