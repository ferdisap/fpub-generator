<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

  <!-- CHECK file ini -->
  <xsl:include href="./child/hotspot.xsl" />
  <xsl:include href="./child/reasonForAmendment.xsl" />

  <!-- CSS
    1. untuk title figure dan table akan diposisi tengah.
    2. height dan width tidak perlu diatur. Tapi jika diatur maka buat saja kecil dan nanti bisa ditampilkan di detail viewer
  -->

  <xsl:template match="graphic">
    <img class="graphic">
      <xsl:call-template name="applicRefId" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:call-template name="id" />
      <xsl:call-template name="security" />

      <xsl:variable name="isIMF" select="substring(string(@infoEntityIdent),'1',3) = 'IMF'" />
      <xsl:variable name="uri">
        <xsl:call-template name="getICNUrn">
        <!-- <xsl:call-template name="getICNUri"> -->
          <xsl:with-param name="isIMF" select="$isIMF" />
        </xsl:call-template>
      </xsl:variable>

      <xsl:if test="$isIMF">
        <xsl:attribute name="imf-ident">
          <xsl:value-of select="@infoEntityIdent" />
        </xsl:attribute>
      </xsl:if>
      <xsl:attribute name="src">
        <xsl:value-of select="$uri" />
      </xsl:attribute>

      <xsl:attribute name="style">
        <xsl:if test="@reproductionWidth">
          <xsl:text>width:</xsl:text>
          <xsl:value-of select="@reproductionWidth" />
          <xsl:text>;</xsl:text>
        </xsl:if>
        <xsl:if test="@reproductionHeight">
          <xsl:text>width:</xsl:text>
          <xsl:value-of select="@reproductionHeight" />
          <xsl:text>;</xsl:text>
        </xsl:if>
        <xsl:if test="@reproductionScale">
          <xsl:text>transform:scale&#40;</xsl:text>
          <xsl:value-of select="@reproductionScale" />
          <xsl:text>&#37;&#41;</xsl:text>
        </xsl:if>
      </xsl:attribute>
    </img>

    <xsl:if test="hotspot">
      <xsl:variable name="name" select="php:function('basename', string(unparsed-entity-uri(@infoEntityIdent)))" />
      <map name="{$name}">
        <xsl:apply-templates select="hotspot" />
      </map>
    </xsl:if>
  </xsl:template>

  <!-- @deprecated, karena sekarang kita tidak nembak langsung ke CSDB, tapi oleh generator akan di bungkus/transform semua csdb object dan icn ke zip files 
        tapi jika file besar seperti video yang mengharuskan response stream maka ini diperlukan tapi tidak di ke $csdb_host melainkan repository host
   -->
  <xsl:template name="getICNUri">
    <xsl:param name="isIMF" />
    <xsl:variable name="filename">
      <xsl:choose>
        <xsl:when test="$isIMF">
          <xsl:variable name="imf" select="document(unparsed-entity-uri(@infoEntityIdent))" />
          <xsl:variable name="imfCode" select="php:function('strtoupper', string($imf/icnMetadataFile/imfIdentAndStatusSection/imfAddress/imfIdent/imfCode/@imfIdentIcn))" />
          <xsl:variable name="extension" select="$imf/icnMetadataFile/imfContent/icnVariation[1]/@fileExtension" />
          <xsl:call-template name="fn_resolve_uri">
            <xsl:with-param name="filename">
              <xsl:text>ICN-</xsl:text>
              <xsl:value-of select="$imfCode" />
              <xsl:text>.</xsl:text>
              <xsl:value-of select="$extension" />
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="unparsed-entity-uri(@infoEntityIdent)" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$filename" />
    <xsl:text>?access_key=</xsl:text>
    <xsl:value-of select="$access_key" />
  </xsl:template>

  <xsl:template name="getICNUrn">
    <xsl:param name="isIMF" />
    <xsl:variable name="icnCode">
      <xsl:choose>
        <xsl:when test="$isIMF">
          <xsl:variable name="imf" select="document(unparsed-entity-uri(@infoEntityIdent))" />
          <xsl:variable name="imfCode" select="php:function('strtoupper', string($imf/icnMetadataFile/imfIdentAndStatusSection/imfAddress/imfIdent/imfCode/@imfIdentIcn))" />
          <xsl:variable name="extension" select="$imf/icnMetadataFile/imfContent/icnVariation[1]/@fileExtension" />
          <xsl:text>ICN-</xsl:text>
          <xsl:value-of select="$imfCode" />
          <xsl:text>.</xsl:text>
          <xsl:value-of select="$extension" />
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="php:function('basename', unparsed-entity-uri(@infoEntityIdent))" />
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <xsl:value-of select="$urn_icn" />
    <xsl:value-of select="$icnCode" />
  </xsl:template>

  <xsl:template match="hotspot">
    <xsl:variable name="shape">
      <xsl:value-of select="php:function('Ptdi\Mpub\Main\Helper::getHotspotShape', string(@objectCoordinates))" />
    </xsl:variable>
    <area id="{@id}" shape="{$shape}" coords="{string(@objectCoordinates)}" name="{string(@applicationStructureIdent)}" alt="{string(@hotspotTitle	)}" />
  </xsl:template>
</xsl:stylesheet>