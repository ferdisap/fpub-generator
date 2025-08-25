<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Sudah di include di xsl lain -->
  <!-- <xsl:include href="./child/para.xsl"/>  -->

  <xsl:template match="listItemDefinition">
    <div class="listItemDefinition">
      <xsl:apply-templates />
    </div>
  </xsl:template>

</xsl:stylesheet>