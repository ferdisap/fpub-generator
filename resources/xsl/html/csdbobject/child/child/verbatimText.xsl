<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- CSS
   1. FONT-FAMILY: monospace (vs02, vs30)
   2. FONT-SIZE: 0.5rem/fs-05 (vs28)
   3. COLOR: #d30038 (vs13), #007936 (vs14), #FFC107 (vs12)
   4. css attribute lainnya mengikuti default
    -->
    
    <!-- <xsl:message>Need general.css</xsl:message> -->
    <!-- <xsl:comment>Need general.css</xsl:comment> -->

  <xsl:template match="verbatimText">    
    <xsl:choose>
      <!-- Filename -->
      <xsl:when test="@verbatimStyle = 'vs02'">
        <span class="verbatimText" verbatimStyle="{@verbatimStyle}"><xsl:apply-templates/></span>
      </xsl:when>

      <!-- XML/SGML element name -->
      <xsl:when test="@verbatimStyle = 'vs12'">
        <code class="verbatimText" verbatimStyle="{@verbatimStyle}" >&#60;<xsl:apply-templates/>&#62;</code>
      </xsl:when>

      <!-- XML/SGML attribute name -->
      <xsl:when test="@verbatimStyle = 'vs13'">
        <code class="verbatimText" verbatimStyle="{@verbatimStyle}"><xsl:apply-templates/></code>
      </xsl:when>

      <!-- XML/SGML attribute value -->
      <xsl:when test="@verbatimStyle = 'vs14'">
        <code class="verbatimText" verbatimStyle="{@verbatimStyle}"><xsl:apply-templates/></code>
      </xsl:when>

      <!-- class name -->
      <xsl:when test="@verbatimStyle = 'vs28'">
        <span class="verbatimText" verbatimStyle="{@verbatimStyle}">Class</span> <code><xsl:apply-templates/></code>
      </xsl:when>

      <!-- method name-->
      <xsl:when test="@verbatimStyle = 'vs30'">
        <span class="verbatimText" verbatimStyle="{@verbatimStyle}">@</span><code><xsl:apply-templates/></code>
      </xsl:when>

      <!-- ERROR comment/message -->
      <xsl:otherwise>
        <code class="verbatimText" verbatimStyle="{@verbatimStyle}" >&#60;<xsl:apply-templates/>&#62;</code>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>