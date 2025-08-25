<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="pubMedia">
    <div class="pubMedia">
      <div class="pubMediaType"><xsl:value-of select="@pubMediaType"/></div>
      <div class="pubMediaCode"><xsl:value-of select="@pubMediaCode"/></div>
      <div class="volumeNumber"><xsl:value-of select="@volumeNumber"/></div>
      <div class="mediaLocation"><xsl:value-of select="@mediaLocation"/></div>
    </div>
  </xsl:template>

</xsl:stylesheet>