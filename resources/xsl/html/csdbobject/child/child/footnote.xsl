<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

  <xsl:include href="./child/para.xsl" />

  <!-- CSS
    1. tulisan footnote kecil semua, seperti yang biasa ada di bottom page halaman buku  
  -->

  <xsl:template match="footnote">
    <xsl:param name="position"><xsl:number level="any"/></xsl:param>
    <xsl:variable name="mark" select="php:function('Ptdi\Mpub\Main\Helper::get_footnote_mark', number($position), string(@footnoteMark))" />
    <xsl:variable name="id">
      <xsl:choose>
        <xsl:when test="@id"><xsl:value-of select="@id"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="generate-id(.)"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <!-- untuk annotation footer -->
    <xsl:call-template name="footnoteRef">
      <xsl:with-param name="mark" select="$mark"/>
      <xsl:with-param name="internalRefId" select="$id"/>
    </xsl:call-template>
    
    <!-- untuk detail footer, jangan pakai div karena nanti akan kacau HTMLnya meskipun .footnote nya sudah di pindha ke bottom-->
    <span class="footnote">
      <xsl:call-template name="applicRefId" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:call-template name="id">
        <xsl:with-param name="id" select="$id"/>
      </xsl:call-template>
      <xsl:call-template name="security" />
      <xsl:if test="@footnoteMark">
        <xsl:attribute name="footnoteMark">
          <xsl:value-of select="@footnoteMark" />
        </xsl:attribute>
      </xsl:if>
      <span class="mark"><xsl:value-of select="$mark"/><xsl:if test="string(@footnoteMark) = 'num' or not(@footnoteMark)"><xsl:text>.</xsl:text>&#160;</xsl:if></span>
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>