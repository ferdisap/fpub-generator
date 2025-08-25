<?xml version="1.0" encoding="UTF-8"?>

<!-- xmlns:v-bind="https://vuejs.org/bind"
xmlns:v-on="https://vuejs.org/on" -->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

  <xsl:template match="applic">
    <div class="applic">
      <xsl:call-template name="id"/>
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:call-template name="changeAttribute"/>
      <xsl:call-template name="security"/>
      <xsl:value-of select="php:function('Ptdi\Mpub\Transformer\Html::getApplicability', $base_uri, .)"/>
    </div>
  </xsl:template>
</xsl:transform>