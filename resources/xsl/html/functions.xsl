<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
  <!-- @deprecated -->
  <xsl:template name="fn_resolve_uri">
    <xsl:param name="filename"/>
    <xsl:variable name="uncorrect_path">
      <xsl:text>/</xsl:text>
      <xsl:value-of select="$csdb_path"/>
      <xsl:text>/</xsl:text>
      <xsl:value-of select="$filename"/>
    </xsl:variable>
    <xsl:variable name="correct_path" select="php:function('str_replace', '//', '/', $uncorrect_path)"/>
    <xsl:value-of select="$csdb_host"/>
    <xsl:value-of select="$correct_path"/>
  </xsl:template>

</xsl:transform>