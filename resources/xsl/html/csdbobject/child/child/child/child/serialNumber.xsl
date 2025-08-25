<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="serialNumber">
    <span class="serialNumber">
      <xsl:attribute name="serialNumberValue">
        <xsl:value-of select="@serialNumberForm"/>
      </xsl:attribute>
      <xsl:value-of select="@serialNumberValue"/>
    </span>
  </xsl:template>

</xsl:stylesheet>