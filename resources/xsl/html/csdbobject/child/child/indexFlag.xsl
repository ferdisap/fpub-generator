<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- JS
   1. Ini seperti block yang ada di sebelah kanan website yang berisi tentang index/content di halaman tersebut.
   2. Jika PDF maka ini seperti di halaman terakhir buku yang ada index per alphabet nya 
  -->

  <!-- CSS
   1. CSS hanya dibuat untuk block yang ada di sebelah kanan website yang berisi tentang index/content di halaman tersebut.
  -->

  <xsl:template match="indexFlag">
    <xsl:attribute name="indexFlag">1</xsl:attribute>
    <xsl:choose>
      <xsl:when test="@indexLevelOne">
        <xsl:attribute name="indexLevel"><xsl:text>1</xsl:text></xsl:attribute>
        <xsl:attribute name="text">
          <xsl:value-of select="@indexLevelOne"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="@indexLevelTwo">
        <xsl:attribute name="indexLevel"><xsl:text>2</xsl:text></xsl:attribute>
        <xsl:attribute name="text">
          <xsl:value-of select="@indexLevelTwo"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="@indexLevelThree">
        <xsl:attribute name="indexLevel"><xsl:text>3</xsl:text></xsl:attribute>
        <xsl:attribute name="text">
          <xsl:value-of select="@indexLevelThree"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:when test="@indexLevelFour">
        <xsl:attribute name="indexLevel"><xsl:text>4</xsl:text></xsl:attribute>
        <xsl:attribute name="text">
          <xsl:value-of select="@indexLevelFour"/>
        </xsl:attribute>
      </xsl:when>
      <xsl:otherwise>
        <xsl:attribute name="indexLevel">0</xsl:attribute>
        <xsl:attribute name="text">
          <xsl:value-of select="string(../.)"/>
        </xsl:attribute>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>