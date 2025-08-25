<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./child/title.xsl"/> -->

    <!-- cek lagin terkait href url dan location nya di anak2nya -->
    <xsl:include href="./child/legend.xsl" />

    <!-- NEXT
        perbaiki tgroup, table dan kemudian selesai serta catat semua attribute yang perlu di kembangkan
    selanjutnya 
    -->

    <!-- CSS
        1. @tabstyle akan di buat sesuai bisnis rule atau buat default
        2. @frame akan dibuat sesuai ketentuan yang sudah ada, ref: https://ferdisap.github.io/S1000D_v5.0_web/attributes/frame.xml
        3. @orient mungkin bisa pakai transform:rotate, sesuai ketentuan yang sudah ada, ref: https://ferdisap.github.io/S1000D_v5.0_web/attributes/orient.xml
        4. @pgwide mungkin tidak di styling karena jika di styling bisa saja table akan memanjang sepenuh panjang display 
        5. border antar cell sepertinya tidak dibuat default karena akan diset di setiap entry nya
    -->

    <!-- JS
        1. @tocentry akan di scan dan dimasukkan kedalam TOC (di mpub pdf sepertinya belum/masih pending) 
    -->

    <!-- @tabstyle @tocentry @frame @orient @pgwide -->
    <xsl:template match="table">
        <div class="table">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:if test="@tabstyle">
                <xsl:attribute name="tabstyle"><xsl:value-of select="@tabstyle" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@tocentry">
                <xsl:attribute name="tocentry"><xsl:value-of select="@tocentry" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@frame">
                <xsl:attribute name="frame"><xsl:value-of select="@frame" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@orient">
                <xsl:attribute name="orient"><xsl:value-of select="@orient" /></xsl:attribute>
            </xsl:if>
            <xsl:if test="@pgwide">
                <xsl:attribute name="pgwide"><xsl:value-of select="@pgwide" /></xsl:attribute>
            </xsl:if>

            <xsl:apply-templates />
        </div>
    </xsl:template>

    <!-- @tgstyle -->
    <xsl:template match="tgroup">
        <table class="tgroup" cols="{@cols}">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:if test="@tgstyle">
                <xsl:attribute name="tgstyle"><xsl:value-of select="@tgstyle" /></xsl:attribute>
            </xsl:if>

            <xsl:apply-templates select="thead" />
            <xsl:apply-templates select="tbody" />
            <xsl:apply-templates select="thead" />
        </table>
    </xsl:template>

    <xsl:template match="thead">
        <thead>
            <xsl:attribute name="style">
                <xsl:if test="@valign"><xsl:text>vertical-align:</xsl:text><xsl:value-of select="@valign" /><xsl:text>;</xsl:text></xsl:if>
            </xsl:attribute>
            <xsl:apply-templates select="row" />
        </thead>
    </xsl:template>

    <xsl:template match="tbody">
        <tbody>
            <xsl:attribute name="style">
                <xsl:if test="@valign"><xsl:text>vertical-align:</xsl:text><xsl:value-of select="@valign" /><xsl:text>;</xsl:text></xsl:if>
            </xsl:attribute>
            <xsl:apply-templates select="row" />
        </tbody>
    </xsl:template>

    <xsl:template match="tfoot">
        <tfoot>
            <xsl:attribute name="style">
                <xsl:if test="@valign"><xsl:text>vertical-align:</xsl:text><xsl:value-of select="@valign" /><xsl:text>;</xsl:text></xsl:if>
            </xsl:attribute>
            <xsl:apply-templates select="row" />
        </tfoot>
    </xsl:template>

    <xsl:template match="row">
        <tr>
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />
            <xsl:apply-templates select="entry" />
        </tr>
    </xsl:template>

    <!-- @char dan @charoff belum digunakan -->
    <xsl:template match="entry">
        <xsl:param name="spanname"><xsl:value-of select="string(@spanname)" /></xsl:param>
        <xsl:param
            name="colname"><xsl:value-of select="string(@colname)" /></xsl:param>

        <xsl:variable 
            name="colnum" select="number(ancestor::*/colspec[@colname = $colname]/@colnum)" />
        <xsl:variable
            name="colsep"><xsl:value-of select="number(ancestor-or-self::*[@colsep])" /></xsl:variable>
        <xsl:variable
            name="rowsep"><xsl:value-of select="number(ancestor-or-self::*[@rowsep])" /></xsl:variable>
        
        <td>
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="id" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="warningRefs" />
            <xsl:call-template name="cautionRefs" />
            <!-- separator akan diatur pakai CSS -->
            <xsl:if test="@colsep or @rowsep">
                <xsl:if test="@colsep"><xsl:attribute name="colsep"><xsl:value-of select="@colsep" /></xsl:attribute></xsl:if>
                <xsl:if
                    test="@rowsep"><xsl:attribute name="rowsep"><xsl:value-of select="@rowsep" /></xsl:attribute></xsl:if>
                <xsl:attribute
                    name="max-colnum"><xsl:value-of select="ancestor::tgroup/@cols" /></xsl:attribute>
                <xsl:attribute
                    name="colnum"><xsl:value-of select="@colnum" /></xsl:attribute>
            </xsl:if>
            <!-- style -->
            <xsl:attribute name="style">
                <xsl:choose>
                    <xsl:when test="@align"><xsl:text>text-align:</xsl:text><xsl:value-of select="@align" /><xsl:text>;</xsl:text></xsl:when>
                    <xsl:when test="ancestor::tgroup/colspec[@colname = $colname]/align"><xsl:text>text-align:</xsl:text><xsl:value-of
                            select="ancestor::tgroup/colspec[@colname = $colname]/align" /><xsl:text>;</xsl:text></xsl:when>
                    <xsl:when test="ancestor::tgroup/@align"><xsl:text>text-align:</xsl:text><xsl:value-of
                            select="ancestor::tgroup/@align" /><xsl:text>;</xsl:text></xsl:when>
                    <xsl:otherwise><xsl:text>text-align:left;</xsl:text></xsl:otherwise>
                </xsl:choose>
                <xsl:if
                    test="@valign"><xsl:text>vertical-align:</xsl:text><xsl:value-of select="@valign" /><xsl:text>;</xsl:text></xsl:if>
                <xsl:if
                    test="@colname and @colname = ancestor::tgroup/colspec[@colname = $colname]/@colname">
                    <xsl:text>width: </xsl:text><xsl:value-of
                        select="ancestor::tgroup/colspec[@colname = $colname]/@colwidth" />
                </xsl:if>
                <xsl:if
                    test="@rotate"><xsl:text>transform:rotate(-90deg)</xsl:text></xsl:if>
            </xsl:attribute>
            <!-- colspan -->
            <!-- Setiap orang yang ingin buat colspan, jangan lupa colname nya juga diinput sesuai
            namest spanname atau tidak pakai spanname (langsung saja pakai attribute namest dan
            nameend) -->
            <xsl:choose>
                <!-- pengetesan @colname untuk memastikan user tidak salah taruh spanname di
                captionEntry -->
                <xsl:when
                    test="@spanname and (@colname = ancestor::tgroup/spanspec[@spanname = $spanname]/@namest)">
                    <xsl:attribute name="colspan">
                        <xsl:call-template name="getColspan">
                            <xsl:with-param name="namest"
                                select="ancestor::tgroup/spanspec[@spanname = $spanname]/@namest" />
                            <xsl:with-param name="nameend"
                                select="ancestor::tgroup/spanspec[@spanname = $spanname]/@nameend" />
                        </xsl:call-template>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="@namest and @nameend">
                    <xsl:attribute name="colspan">
                        <xsl:call-template name="getColspan">
                            <xsl:with-param name="namest" select="@namest" />
                            <xsl:with-param name="nameend" select="@nameend" />
                        </xsl:call-template>
                    </xsl:attribute>
                </xsl:when>
            </xsl:choose>
            <!-- end of colspan -->
            <!-- rowspan -->
            <xsl:if test="@morerows">
                <xsl:attribute name="rowspan"><xsl:value-of select="number(@morerows) + 1" /></xsl:attribute>
            </xsl:if>
            <!-- end of rowspan -->
            <xsl:apply-templates />
        </td>
    </xsl:template>

</xsl:stylesheet>