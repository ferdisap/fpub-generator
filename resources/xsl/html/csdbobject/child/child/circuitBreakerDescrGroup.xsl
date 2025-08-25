<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./child/warningAndCautionElemGroup.xsl" /> -->
    <!-- <xsl:include href="./child/ncpElemGroup.xsl" /> -->
    <!-- <xsl:include href="./child/fmftElemGroup.xsl" /> -->

    <xsl:include href="./child/circuitBreakerRef.xsl" />
    <xsl:include href="./child/internalRef.xsl" />

    <!-- Check lagi filenya -->
    <xsl:include href="./child/name.xsl" />
    <xsl:include href="./child/accessPointRef.xsl" />
    <xsl:include href="./child/footnoteRemarks.xsl" />
    
    <!-- CSS
        1. untuk @circuitBreakerAction nanti akan ada tooltip bergambar atau cukup text saja. 
        2. element <circuitBreakerDescrGroup> harus berupa container flex atau column yang isinya <circuitBreakerDescrSubGroup>
        3. element <circuitBreakerDescrSubGroup> berupa block.
    -->

    <!-- OUTSTANDING
        1. @checksum belum digunakan 
    -->

    <xsl:template match="circuitBreakerDescrGroup">
        <div class="circuitBreakerDescrGroup">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:if test="circuitBreakerAction">
                <xsl:attribute name="circuitBreakerAction">
                    <xsl:value-of select="@circuitBreakerAction"/>
                </xsl:attribute>    
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="circuitBreakerDescrSubGroup">
        <div class="circuitBreakerDescrSubGroup">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:if test="circuitBreakerAction">
                <xsl:attribute name="circuitBreakerAction">
                    <xsl:value-of select="@circuitBreakerAction"/>
                </xsl:attribute>    
            </xsl:if>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="circuitBreakerDescr">
        <div class="circuitBreakerDescr">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="circuitBreakerLocation">
        <span class="circuitBreakerLocation">
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:apply-templates/>
        </span>
    </xsl:template>
    

</xsl:stylesheet>