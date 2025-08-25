<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="identExtension">
    <span class="identExtension">
      <!-- extensionProducer is CAGE Code -->
       <xsl:attribute name="extensionProducer">
        <xsl:value-of select="@extensionProducer"/>
      </xsl:attribute>
      <!-- uppercase alphabetic (A-Z) and numeric (0-9) characters. -->
      <xsl:value-of select="@extensionCode"/>
    </span>
  </xsl:template>

</xsl:stylesheet>