<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl" xmlns:v-bind="https://vuejs.org/bind"
  xmlns:v-on="https://vuejs.org/on">

  <xsl:output method="html" encoding="utf-8" indent="yes" />

  <xsl:include href="../html/csdbobject/content.xsl" />
  <xsl:include href="../html/body.xsl" />
  <xsl:include href="../html/content.xsl" />
  <xsl:include href="../html/navigation.xsl" />
  <xsl:include href="../html/address.xsl" />
  <xsl:include href="../html/ident.xsl" />
  <xsl:include href="../html/status.xsl" />
  <xsl:include href="../html/functions.xsl" />

  <!-- @depreaced sekarang menggunakan URN, semua data/pub module harus sudah di generate, tidak lagi online runtime, 
   base uri untuk CSDBObject, berbeda dengan path-->
  <xsl:param name="base_uri" />
  <!-- host untuk csdb misal locahost:1003, atau ferdisap.github.io -->
  <xsl:param name="csdb_host" />
  <!-- path di url untuk csdb object location di csdb server -->
  <xsl:param name="csdb_path" />
  <!-- digunakan jika perlu mengakses data module dari csdb server -->
  <xsl:param name="access_key" />
  <!-- untuk base url misal "ferdisap.github.io/fpub-viewer/assets/..." fpub-viewer adalah base -->
  <xsl:param name="base" />
  <!-- @depreaced sekarang menggunakan URN, semua data/pub module harus sudah di generate, tidak lagi online runtime, 
   module_extension digunakan jika ada referensi seperti dmRef -->
  <xsl:param name="module_extension">.xml</xsl:param>
  <!-- urn to resolve semua url terkait csdb object-->
  <xsl:param name="urn_s1000d">URN:S1000D:</xsl:param>
  <xsl:param name="urn_icn">URN:ICN:</xsl:param>

  <xsl:template match="/">
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
    <html>
      <head>
        <!-- root node name eg: dmodule, icnMetadataFile, etc -->
        <meta name="doctype" content="{name(./*)}"></meta>
        <link rel="stylesheet" href="{concat($base, '/css/index.css')}" />
        <title>Data Module</title>
        <link rel="icon" type="image/png" href="{concat($base, '/assets/logo-16x16.png')}" />
      </head>
      <body>
        <div class="body">
          <!-- second child node name eg: content-->
          <xsl:call-template name="body">
            <xsl:with-param name="main_content">
              <xsl:call-template name="content"/>
            </xsl:with-param>
          </xsl:call-template>

          <xsl:call-template name="navigation"/>
          
          <xsl:call-template name="ident"/>

          <xsl:call-template name="address"/>

          <xsl:call-template name="status"/>

        </div>
      </body>
    </html>
  </xsl:template>

  <!-- @deprecated, dipindah ke functions.xsl-->
  <!-- <xsl:template name="resolve_uri">
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
  </xsl:template> -->

  <!-- NOTE: yang belum dilengkapi
    1. crewDrill.xsl 
    2. multimedia.xsl // class untuk identify extension icn
    3. foldout.xsl, belum dibuat filenya, cek description.xsl
  -->
</xsl:transform>