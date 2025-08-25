<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./child/headingElemGroup.xsl" /> -->
    <!-- <xsl:include href="./child/normalParaElemGroup.xsl" /> -->
    <!-- <xsl:include href="./child/levelledParaAlts.xsl" /> -->

    <xsl:template match="levelledPara">
        <div class="levelledPara">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />
            <xsl:call-template name="warningRefs" />
            <xsl:call-template name="cautionRefs" />

            <!-- check level based on numbering eg: 1.2.1 is level 2 -->
            <xsl:variable name="number">
                <xsl:number level="multiple" count="levelledPara" />
            </xsl:variable>
            <xsl:variable name="level">
                <xsl:value-of select="php:function('Ptdi\Mpub\Transformer\Transformator::checkLevelByPrefix', $number)"/>
            </xsl:variable>
            <xsl:apply-templates>
                <xsl:with-param name="titleLevel" select="$level" />
                <xsl:with-param name="prefix" select="$number"/>
            </xsl:apply-templates>
        </div>
    </xsl:template>

</xsl:stylesheet>