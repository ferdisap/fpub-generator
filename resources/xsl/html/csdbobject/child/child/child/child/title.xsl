<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Sudah di include di xsl lain -->
  <!-- <xsl:include href="textElemGroupStyle.xsl"/> -->

  <!-- CSS
    1. untuk title figure dan table akan diposisi tengah.
  -->

  <xsl:template match="title">
    <xsl:param name="titleLevel">6</xsl:param>
    <xsl:param name="prefix" />

    <xsl:variable name="localParentName">
      <xsl:value-of select="local-name(parent::*)" />
    </xsl:variable>

    <xsl:variable name="tagName">
      <xsl:choose>
        <xsl:when test="$localParentName = 'figure'">
          <xsl:text>figCaption</xsl:text>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>h</xsl:text>
          <xsl:value-of select="$titleLevel"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:element name="{$tagName}">
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:call-template name="security" />
      <xsl:call-template name="class_for_title">
        <xsl:with-param name="level" select="$titleLevel" />
        <xsl:with-param name="localParentName" select="$localParentName" />
      </xsl:call-template>

      <xsl:choose>
        <xsl:when test="$localParentName = 'crewDrill' or $localParentName = 'subCrewDrill'">
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:when test="$localParentName = 'table'">
          <xsl:variable name="pf">
            <xsl:text>Table</xsl:text>
            <xsl:text>&#160;</xsl:text>
            <xsl:number level="any" count="title" />
            <xsl:text>&#160;&#160;</xsl:text>
          </xsl:variable>
          <xsl:value-of select="$pf" />
          <xsl:apply-templates/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$prefix" />
          <!-- <xsl:number level="multiple" count="levelledPara"/> -->
          <xsl:text>&#160;&#160;&#160;</xsl:text>
          <xsl:apply-templates />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:template>

  <xsl:template name="class_for_title">
    <xsl:param name="level"/>
    <xsl:param name="localParentName" />
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="local-name(parent::*) = 'levelledPara'">
          <xsl:choose>
            <xsl:when test="$level = 1">
              <xsl:text>title dm-side-head-no-1</xsl:text>
            </xsl:when>
            <xsl:when test="$level = 2">
              <xsl:text>title dm-side-head-no-2</xsl:text>
            </xsl:when>
            <xsl:when test="$level = 3">
              <xsl:text>title dm-side-head-no-3</xsl:text>
            </xsl:when>
            <xsl:when test="$level = 4">
              <xsl:text>title dm-side-head-no-4</xsl:text>
            </xsl:when>
            <xsl:when test="$level = 5">
              <xsl:text>title dm-side-head-no-5</xsl:text>
            </xsl:when>
            <xsl:otherwise>
              <xsl:text>title dm-general-title</xsl:text>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:text>title dm-general-title</xsl:text>
          <xsl:text>&#32;</xsl:text>
          <xsl:text>parent-</xsl:text>
          <xsl:value-of select="$localParentName" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>
</xsl:stylesheet>