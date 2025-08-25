<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

  <xsl:include href="./child/identExtension.xsl" />
  <xsl:include href="./child/pmCode.xsl" />
  <xsl:include href="./child/issueInfo.xsl" />
  <xsl:include href="./child/language.xsl" />


  <xsl:template match="pmRefIdent">
    <xsl:call-template name="pmRefIdent">
      <xsl:with-param name="useExtension" select="boolean(0)" />
    </xsl:call-template>
  </xsl:template>

  <xsl:template name="pmRefIdent">
    <xsl:param name="useExtension" select="boolean(0)" />
    <xsl:if test="identExtension">
      <xsl:apply-templates select="identExtension" />
      <xsl:text>:&#160;</xsl:text>
    </xsl:if>
    <xsl:variable name="filename">
      <xsl:call-template name="resolvePMFilename">
        <xsl:with-param name="useExtension" select="$useExtension" />
      </xsl:call-template>
    </xsl:variable>
    <a class="pmRefIdent" referredFragment="{@referredFragment}" href="{concat($urn_s1000d, $filename)}"><xsl:value-of select="$filename"/></a>
  </xsl:template>

  <xsl:template name="resolvePMFilename">
    <xsl:param name="useExtension" select="boolean(0)" />
    <xsl:variable name="filename">
      <xsl:text>PMC-</xsl:text>
      <xsl:apply-templates select="pmCode" />
      <xsl:if test="issueInfo">
        <xsl:text>_</xsl:text>
        <xsl:apply-templates select="issueInfo" />
      </xsl:if>
      <xsl:if test="language">
        <xsl:text>_</xsl:text>
        <xsl:apply-templates select="language" />
      </xsl:if>
    </xsl:variable>
    <xsl:value-of select="php:function('strtoupper', string($filename))" />
    <!-- @depreacted karena sekarang menggunakan URN, semua data/pub module harus sudah di generate, tidak lagi online runtime -->
    <!-- <xsl:if test="boolean($useExtension)"><xsl:value-of select="$module_extension" /></xsl:if> -->
  </xsl:template>
  
</xsl:stylesheet>