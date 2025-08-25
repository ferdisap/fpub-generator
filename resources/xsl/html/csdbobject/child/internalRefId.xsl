<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- CSS 
   1. berwarna seperti anchor tag,
   2. cursor pointer ketika mouseover,
   3. kalau bisa ada tooltip berisi target @id
    -->
  
  <!-- JS
   1. ketika onclick, top window url ada hash ID target nya
   2. ketika mouseover, tampilkan tooltip dengan isi dari target @id
    -->

  <xsl:template name="internalRefId">
    <xsl:param name="internalRefId" select="@internalRefId"/>
    <xsl:if test="$internalRefId">
      <xsl:attribute name="internalRefId">
        <xsl:value-of select="$internalRefId"/>
      </xsl:attribute>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>