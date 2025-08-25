<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/note.xsl"/>

  <!-- Sudah di include di xsl lain -->
  <!-- <xsl:include href="para.xsl"/>  -->

  <xsl:template match="listItem">
    <li class="listItem">
      <xsl:apply-templates />
    </li>
  </xsl:template>

</xsl:stylesheet>