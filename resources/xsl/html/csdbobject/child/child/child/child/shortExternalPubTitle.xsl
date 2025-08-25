<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- sudah di include di xsl lain -->
<!-- <xsl:include href="indexFlag.xsl"/>
<xsl:include href="subScript.xsl"/>
<xsl:include href="superScript.xsl"/>
<xsl:include href="acronym.xsl"/>
<xsl:include href="acronymTerm.xsl"/>
<xsl:include href="verbatimText.xsl"/> -->

  <xsl:template match="shortExternalPubTitle">
    <h1 class="shortExternalPubTitle">
      <xsl:apply-templates/>
    </h1>
  </xsl:template>

</xsl:stylesheet>