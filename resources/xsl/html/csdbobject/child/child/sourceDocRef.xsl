<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- sudah di includkan di xsl lain -->
<!-- <xsl:include href="./child/internalRef.xsl"/>
<xsl:include href="./child/dmRef.xsl"/>
<xsl:include href="./child/pmRef.xsl"/>
<xsl:include href="./child/externalPubRef.xsl"/> -->

  <xsl:template match="sourceDocRef">
    <span class="sourceDocRef">
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>