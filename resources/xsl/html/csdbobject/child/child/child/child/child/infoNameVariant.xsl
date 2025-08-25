<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="infoNameVariant">
    <div class="infoNameVariant dm-center-head-no-2">
      <xsl:call-template name="security"/>
      <xsl:apply-templates/>
    </div>
  </xsl:template>

</xsl:stylesheet>