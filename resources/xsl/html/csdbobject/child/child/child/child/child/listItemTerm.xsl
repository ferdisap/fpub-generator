<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Sudah di include di xsl lain -->
  <!-- <xsl:include href="textElemGroupStyle.xsl"/>  -->

  <xsl:template match="listItemTerm">
    <span class="listItemTerm">
      <xsl:apply-templates />
    </span>
  </xsl:template>

</xsl:stylesheet>