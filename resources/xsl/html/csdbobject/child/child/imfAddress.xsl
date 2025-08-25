<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl" xmlns:v-bind="https://vuejs.org/bind"
  xmlns:v-on="https://vuejs.org/on">

  <xsl:include href="./child/imfIdent.xsl" />
  <xsl:include href="./child/imfAddressItems.xsl" />

  <xsl:template match="imfAddress">
    <div class="imfAddress">
      <xsl:apply-templates select="imfIdent"/>
      <xsl:apply-templates select="imfAddressItems"/>
    </div>
  </xsl:template>


</xsl:transform>