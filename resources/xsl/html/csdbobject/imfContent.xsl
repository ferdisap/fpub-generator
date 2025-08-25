<?xml version="1.0" encoding="UTF-8"?>

<!-- OUTSTANDING
  1. belum mengaplikasikan <catalogSeqNumber>, dan <icnSupportingFiles>
-->

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl">

  <xsl:template match="imfContent">
    <div class="imfContent">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="icnVariation">
    <div class="icnVariation">
      <xsl:attribute name="fileExtension">
        <xsl:value-of select="@fileExtension"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="icnInfoItemGroup">
    <div class="icnInfoItemGroup">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="icnInfoItemGroup">
    <div class="icnInfoItemGroup">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="icnInfoItem">
    <div class="icnInfoItem">
      <xsl:attribute name="icnInfoItemType">
        <xsl:value-of select="@icnInfoItemType"/>
      </xsl:attribute>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="icnContents">
    <div class="icnContents">
      <xsl:apply-templates/>
    </div>
  </xsl:template>

  <xsl:template match="icnObjectGroup">
    <div class="icnObjectGroup">
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  <xsl:template match="icnObject">
    <div class="icnObject">
      <xsl:if test="@id"><xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute></xsl:if>
      <xsl:if test="@icnObjectIdent"><xsl:attribute name="icnObjectIdent"><xsl:value-of select="@icnObjectIdent"/></xsl:attribute></xsl:if>
      <xsl:if test="@icnObjectName"><xsl:attribute name="icnObjectName"><xsl:value-of select="@icnObjectName"/></xsl:attribute></xsl:if>
      <xsl:if test="@icnObjectType"><xsl:attribute name="icnObjectType"><xsl:value-of select="@icnObjectType"/></xsl:attribute></xsl:if>
      <xsl:if test="@icnObjectTitle"><xsl:attribute name="icnObjectTitle"><xsl:value-of select="@icnObjectTitle"/></xsl:attribute></xsl:if>
      <xsl:if test="@objectDescr"><xsl:attribute name="objectDescr"><xsl:value-of select="@objectDescr"/></xsl:attribute></xsl:if>
      <xsl:if test="@objectCoordinates"><xsl:attribute name="objectCoordinates"><xsl:value-of select="@objectCoordinates"/></xsl:attribute></xsl:if>
      <xsl:apply-templates/>
    </div>
  </xsl:template>
  
  </xsl:transform>