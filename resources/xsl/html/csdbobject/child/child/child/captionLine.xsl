<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- sudah di includkan di xsl lain -->
  <!-- <xsl:include href="acronymTerm.xsl"/> -->

  <!-- CSS
    1. captionLine class sama dengan "text-nowrap fw-bold"
  -->

  <xsl:template match="captionLine">
    <span class="captionLine">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>