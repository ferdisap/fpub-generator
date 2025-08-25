<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

    <!-- attribute yang belum digunakan
      1. @char
      2. @charoff 
      kedua atribute ini terkait alignment yang menggunakan character seperti "." decimal atau lainnya
    -->

    <!-- catatan:
      1. rowsep dan colsep: 
          1.1. Jika tidak digunakan maka akan menggunakan rule parent nya. 
          1.2. Jika bernilai 0 maka rule parent nya di overide. Misal ada satu entry yang pakai rowsep (entry lain tidak pakai rowsep) dan parentnya pakai rowsep juga (artinya seluruh entry di row itu pakai separator) maka nanti ada satu entry yang rownya TIDAK pakai separator.
          1.3. Jika bernilai 1 maka sama seperti 1.2. Yang parentnya tidak pakai rowsep/colsep maka anaknya akan pakai rowsep.
    -->

    <!-- JS
      1. setiap <td> yang ber-attribute @colsep or @rowsep maka akan di tambahkan class tertentu untuk menambah/menghapus separator. attribute @max-colnum dan @colnum mungkin diperlukan sesuai catatan diatas.
    -->
    
    <xsl:include href="./child/captionLine.xsl"/>
    <xsl:include href="./child/captionText.xsl"/>
    <xsl:include href="./child/caption.xsl"/>

    <!-- captionGroup for display block -->
    <xsl:template match="captionGroup[parent::levelledPara]">
      <div class="captionGroup-container">
        <table class="captionGroup" cols="{@cols}">
          <xsl:call-template name="applicRefId"/>
          <xsl:call-template name="changeAttribute"/>
          <xsl:call-template name="controlAuthorityRefs"/>
          <xsl:call-template name="id"/>
          <xsl:call-template name="security"/>
          <xsl:apply-templates select="captionBody"/>
        </table>
      </div>
    </xsl:template>

    <!-- captionGroup for display inline, eg: inside reqCond, thumbTabText, caseCond, changeInline, emphasis, listItemTerm, reasonForAmendment, title, para -->
    <xsl:template match="captionGroup[parent::reqCond] | captionGroup[parent::thumbTabText] | captionGroup[parent::caseCond] | captionGroup[parent::changeInline] | captionGroup[parent::emphasis] | captionGroup[parent::listItemTerm] | captionGroup[parent::reasonForAmendment] | captionGroup[parent::title] | captionGroup[parent::para]">
      <span class="captionGroup-container">
        <span class="captionGroup" cols="{@cols}">
          <xsl:call-template name="applicRefId"/>
          <xsl:call-template name="changeAttribute"/>
          <xsl:call-template name="controlAuthorityRefs"/>
          <xsl:call-template name="id"/>
          <xsl:call-template name="security"/>
          <xsl:apply-templates select="colspec"/>
          <xsl:apply-templates select="captionBody"/>
        </span>
      </span>
    </xsl:template>

    <xsl:template match="captionBody">
      <tbody class="captionBody">
          <xsl:call-template name="applicRefId"/>
          <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:attribute name="style">
              <xsl:if test="@valign"><xsl:text>vertical-align:</xsl:text><xsl:value-of select="@valign"/><xsl:text>;</xsl:text></xsl:if>
            </xsl:attribute>
            <xsl:apply-templates select="captionRow"/>
        </tbody>
    </xsl:template>

    <!-- captioBody for display inline, eg: inside reqCond, thumbTabText, caseCond, changeInline, emphasis, listItemTerm, reasonForAmendment, title, para -->
    <xsl:template match="captionBody[ancestor::reqCond] | captionBody[ancestor::thumbTabText] | captionBody[ancestor::caseCond] | captionBody[ancestor::changeInline] | captionBody[ancestor::emphasis] | captionBody[ancestor::listItemTerm] | captionBody[ancestor::reasonForAmendment] | captionBody[ancestor::title] | captionBody[ancestor::para]">
      <span class="captionBody">
          <xsl:call-template name="applicRefId"/>
          <xsl:call-template name="controlAuthorityRefs"/>
          <xsl:attribute name="style">
            <xsl:if test="@valign"><xsl:text>vertical-align:</xsl:text><xsl:value-of select="@valign"/><xsl:text>;</xsl:text></xsl:if>
          </xsl:attribute>
          <xsl:apply-templates select="captionRow"/>
      </span>
    </xsl:template>

    <xsl:template match="captionRow">
        <tr class="captionRow">
            <xsl:call-template name="applicRefId"/>
            <xsl:call-template name="changeAttribute"/>
            <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:call-template name="id"/>
            <xsl:call-template name="security"/>
            <xsl:apply-templates select="captionEntry"/>
        </tr>
    </xsl:template>

    <!-- captionRow for display inline, eg: inside reqCond, thumbTabText, caseCond, changeInline, emphasis, listItemTerm, reasonForAmendment, title, para -->
    <xsl:template match="captionRow[ancestor::reqCond] | captionRow[ancestor::thumbTabText] | captionRow[ancestor::caseCond] | captionRow[ancestor::changeInline] | captionRow[ancestor::emphasis] | captionRow[ancestor::listItemTerm] | captionRow[ancestor::reasonForAmendment] | captionRow[ancestor::title] | captionRow[ancestor::para]">
        <span class="captionRow">
            <xsl:call-template name="applicRefId"/>
            <xsl:call-template name="changeAttribute"/>
            <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:call-template name="id"/>
            <xsl:call-template name="security"/>
            <xsl:apply-templates select="captionEntry"/>
        </span>
    </xsl:template>

    <xsl:template match="captionEntry">
        <xsl:param name="spanname"><xsl:value-of select="string(@spanname)"/></xsl:param>
        <xsl:param name="colname"><xsl:value-of select="string(@colname)"/></xsl:param>

        <xsl:variable name="colnum" select="number(ancestor::captionGroup/colspec[@colname = $colname]/@colnum)"/>
        <xsl:variable name="colsep"><xsl:value-of select="number(ancestor-or-self::*[@colsep])"/></xsl:variable>
        <xsl:variable name="rowsep"><xsl:value-of select="number(ancestor-or-self::*[@rowsep])"/></xsl:variable>

        <td class="captionEntry">
          <xsl:call-template name="applicRefId"/>
          <xsl:call-template name="controlAuthorityRefs"/>
          <xsl:call-template name="colname"/>
          <xsl:call-template name="namest"/>
          <xsl:call-template name="nameend"/>
          <!-- separator akan diatur pakai CSS -->
          <xsl:if test="@colsep or @rowsep">
            <xsl:if test="@colsep"><xsl:attribute name="colsep"><xsl:value-of select="@colsep"/></xsl:attribute></xsl:if>
            <xsl:if test="@rowsep"><xsl:attribute name="rowsep"><xsl:value-of select="@rowsep"/></xsl:attribute></xsl:if>
            <xsl:attribute name="max-colnum"><xsl:value-of select="ancestor::captionGroup/@cols"/></xsl:attribute>
            <xsl:attribute name="colnum"><xsl:value-of select="@colnum"/></xsl:attribute>
          </xsl:if>
          <!-- style -->
          <xsl:attribute name="style">
            <xsl:choose>
              <xsl:when test="@alignCaptionEntry"><xsl:text>text-align:</xsl:text><xsl:value-of select="@alignCaptionEntry"/><xsl:text>;</xsl:text></xsl:when>
              <xsl:when test="ancestor::captionGroup/colspec[@colname = $colname]/align"><xsl:text>text-align:</xsl:text><xsl:value-of select="ancestor::captionGroup/colspec[@colname = $colname]/align"/><xsl:text>;</xsl:text></xsl:when>
              <xsl:when test="ancestor::captionGroup/@alignCaption"><xsl:text>text-align:</xsl:text><xsl:value-of select="ancestor::captionGroup/@alignCaption"/><xsl:text>;</xsl:text></xsl:when>
              <xsl:otherwise><xsl:text>text-align:left;</xsl:text></xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@valign"><xsl:text>vertical-align:</xsl:text><xsl:value-of select="@valign"/><xsl:text>;</xsl:text></xsl:if>
            <xsl:if test="@colname and @colname = ancestor::captionGroup/colspec[@colname = $colname]/@colname">
              <xsl:text>width: </xsl:text><xsl:value-of select="ancestor::captionGroup/colspec[@colname = $colname]/@colwidth"/>
            </xsl:if>
          </xsl:attribute>          
          <!-- colspan -->
          <!-- Setiap orang yang ingin buat colspan, jangan lupa colname nya juga diinput sesuai namest spanname atau tidak pakai spanname (langsung saja pakai attribute namest dan nameend) -->
          <xsl:choose>
            <!-- pengetesan @colname untuk memastikan user tidak salah taruh spanname di captionEntry -->
            <xsl:when test="@spanname and (@colname = ancestor::captionGroup/spanspec[@spanname = $spanname]/@namest)">
              <xsl:attribute name="colspan">
                <xsl:call-template name="getColspan">
                  <xsl:with-param name="namest" select="ancestor::captionGroup/spanspec[@spanname = $spanname]/@namest"/>
                  <xsl:with-param name="nameend" select="ancestor::captionGroup/spanspec[@spanname = $spanname]/@nameend"/>
                </xsl:call-template>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="@namest and @nameend">            
              <xsl:attribute name="colspan">
                <xsl:call-template name="getColspan">
                  <xsl:with-param name="namest" select="@namest"/>
                  <xsl:with-param name="nameend" select="@nameend"/>
                </xsl:call-template>
              </xsl:attribute>
            </xsl:when>
          </xsl:choose>
          <!-- end of colspan -->
          <!-- rowspan -->
          <xsl:if test="@morerows">
            <xsl:attribute name="rowspan"><xsl:value-of select="number(@morerows) + 1"/></xsl:attribute>
          </xsl:if>
          <!-- end of rowspan -->
          <xsl:apply-templates/>
        </td>
    </xsl:template>

    <!-- captionEntry for display inline, eg: inside reqCond, thumbTabText, caseCond, changeInline, emphasis, listItemTerm, reasonForAmendment, title, para -->
    <!-- <xsl:template match="captionEntry"> -->
    <xsl:template match="captionEntry[ancestor::reqCond] | captionEntry[ancestor::thumbTabText] | captionEntry[ancestor::caseCond] | captionEntry[ancestor::changeInline] | captionEntry[ancestor::emphasis] | captionEntry[ancestor::listItemTerm] | captionEntry[ancestor::reasonForAmendment] | captionEntry[ancestor::title] | captionEntry[ancestor::para]">
        <xsl:param name="spanname"><xsl:value-of select="string(@spanname)"/></xsl:param>
        <xsl:param name="colname"><xsl:value-of select="string(@colname)"/></xsl:param>

        <xsl:variable name="colnum" select="number(ancestor::captionGroup/colspec[@colname = $colname]/@colnum)"/>
        <xsl:variable name="colsep"><xsl:value-of select="number(ancestor-or-self::*[@colsep])"/></xsl:variable>
        <xsl:variable name="rowsep"><xsl:value-of select="number(ancestor-or-self::*[@rowsep])"/></xsl:variable>

        <span class="captionEntry">
          <xsl:call-template name="applicRefId"/>
          <xsl:call-template name="controlAuthorityRefs"/>
          <xsl:call-template name="colname"/>
          <xsl:call-template name="namest"/>
          <xsl:call-template name="nameend"/>
          <!-- separator akan diatur pakai CSS -->
          <xsl:if test="@colsep or @rowsep">
            <xsl:if test="@colsep"><xsl:attribute name="colsep"><xsl:value-of select="@colsep"/></xsl:attribute></xsl:if>
            <xsl:if test="@rowsep"><xsl:attribute name="rowsep"><xsl:value-of select="@rowsep"/></xsl:attribute></xsl:if>
            <xsl:attribute name="max-colnum"><xsl:value-of select="ancestor::captionGroup/@cols"/></xsl:attribute>
            <xsl:attribute name="colnum"><xsl:value-of select="@colnum"/></xsl:attribute>
          </xsl:if>
          <!-- style -->
          <xsl:attribute name="style">
            <xsl:choose>
              <xsl:when test="@alignCaptionEntry"><xsl:text>justify-content:</xsl:text><xsl:value-of select="@alignCaptionEntry"/><xsl:text>;</xsl:text></xsl:when>
              <xsl:when test="ancestor::captionGroup/colspec[@colname = $colname]/align"><xsl:text>justify-content:</xsl:text><xsl:value-of select="ancestor::captionGroup/colspec[@colname = $colname]/align"/><xsl:text>;</xsl:text></xsl:when>
              <xsl:when test="ancestor::captionGroup/@alignCaption"><xsl:text>justify-content:</xsl:text><xsl:value-of select="ancestor::captionGroup/@alignCaption"/><xsl:text>;</xsl:text></xsl:when>
              <xsl:otherwise><xsl:text>justify-content:left;</xsl:text></xsl:otherwise>
            </xsl:choose>
            <xsl:if test="@valign"><xsl:text>align-items:</xsl:text><xsl:apply-templates select="@valign"/><xsl:text>;</xsl:text></xsl:if>
            <xsl:if test="@colname and @colname = ancestor::captionGroup/colspec[@colname = $colname]/@colname">
              <xsl:text>width: </xsl:text><xsl:value-of select="ancestor::captionGroup/colspec[@colname = $colname]/@colwidth"/>
            </xsl:if>
          </xsl:attribute>          
          <!-- <xsl:if test="@valign">
            <xsl:attribute name="valign">
              <xsl:value-of select="@valign"/>
            </xsl:attribute>
          </xsl:if> -->
          <!-- colspan -->
          <!-- Setiap orang yang ingin buat colspan, jangan lupa colname nya juga diinput sesuai namest spanname atau tidak pakai spanname (langsung saja pakai attribute namest dan nameend) -->
          <!-- <xsl:choose> -->
            <!-- pengetesan @colname untuk memastikan user tidak salah taruh spanname di captionEntry -->
            <!-- <xsl:when test="@spanname and (@colname = ancestor::captionGroup/spanspec[@spanname = $spanname]/@namest)">
              <xsl:attribute name="colspan">
                <xsl:call-template name="getColspan">
                  <xsl:with-param name="namest" select="ancestor::captionGroup/spanspec[@spanname = $spanname]/@namest"/>
                  <xsl:with-param name="nameend" select="ancestor::captionGroup/spanspec[@spanname = $spanname]/@nameend"/>
                </xsl:call-template>
              </xsl:attribute>
            </xsl:when>
            <xsl:when test="@namest and @nameend">            
              <xsl:attribute name="colspan">
                <xsl:call-template name="getColspan">
                  <xsl:with-param name="namest" select="@namest"/>
                  <xsl:with-param name="nameend" select="@nameend"/>
                </xsl:call-template>
              </xsl:attribute>
            </xsl:when> -->
          <!-- </xsl:choose> -->
          <!-- end of colspan -->
          <!-- rowspan -->
          <xsl:if test="@morerows">
            <xsl:attribute name="morerows"><xsl:value-of select="number(@morerows)"/></xsl:attribute>
          </xsl:if>
          <!-- end of rowspan -->
          <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="@valign">
      <xsl:variable name="valign" select="."/>
      <xsl:choose>
        <xsl:when test="$valign = 'bottom'">end</xsl:when>
        <xsl:when test="$valign = 'middle'">center</xsl:when>
        <xsl:when test="$valign = 'top'">normal</xsl:when>
        <xsl:otherwise><xsl:text>normal</xsl:text></xsl:otherwise>
      </xsl:choose>
    </xsl:template>

    <xsl:template match="colspec[ancestor::reqCond] | colspec[ancestor::thumbTabText] | colspec[ancestor::caseCond] | colspec[ancestor::changeInline] | colspec[ancestor::emphasis] | colspec[ancestor::listItemTerm] | colspec[ancestor::reasonForAmendment] | colspec[ancestor::title] | colspec[ancestor::para]">
      <span class="colspec" colname="{@colname}" colnum="{@colnum}" colwidth="{@colwidth}"/>
    </xsl:template>

    <xsl:template match="spanspec[ancestor::reqCond] | spanspec[ancestor::thumbTabText] | spanspec[ancestor::caseCond] | spanspec[ancestor::changeInline] | spanspec[ancestor::emphasis] | spanspec[ancestor::listItemTerm] | spanspec[ancestor::reasonForAmendment] | spanspec[ancestor::title] | spanspec[ancestor::para]">
      <span class="spanspec" colname="{@colname}" colnum="{@colnum}" colwidth="{@colwidth}"/>
    </xsl:template>

    <xsl:template name="getColspan">
      <xsl:param name="namest"/>
      <xsl:param name="nameend"/>

      <xsl:variable name="namestPos">
        <xsl:for-each select="ancestor::captionGroup/colspec">
          <xsl:if test="@colname = string($namest)">
            <xsl:number/>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>  
      <xsl:variable name="nameendPos">
        <xsl:for-each select="ancestor::captionGroup/colspec">
          <xsl:if test="@colname = string($nameend)">
            <xsl:number/>
          </xsl:if>
        </xsl:for-each>
      </xsl:variable>

      <xsl:value-of select="number($nameendPos) - number($namestPos) + 1"/>
    </xsl:template>

    <xsl:template name="colname">
      <xsl:if test="@colname">
        <xsl:attribute name="colname"><xsl:value-of select="@colname"/></xsl:attribute>
      </xsl:if>
    </xsl:template>

    <xsl:template name="namest">
      <xsl:if test="@namest">
        <xsl:attribute name="namest"><xsl:value-of select="@namest"/></xsl:attribute>
      </xsl:if>
    </xsl:template>

    <xsl:template name="nameend">
      <xsl:if test="@nameend">
        <xsl:attribute name="nameend"><xsl:value-of select="@nameend"/></xsl:attribute>
      </xsl:if>
    </xsl:template>
    
</xsl:stylesheet>