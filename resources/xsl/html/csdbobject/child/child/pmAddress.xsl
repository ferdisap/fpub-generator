<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/pmIdent.xsl" />
  <xsl:include href="./child/pmAddressItems.xsl" />

  <xsl:template match="pmAddress">
    <div class="pmAddress">
      <xsl:apply-templates select="pmIdent"/>
      <xsl:apply-templates select="pmAddressItems"/>
    </div>
  </xsl:template>


</xsl:transform>