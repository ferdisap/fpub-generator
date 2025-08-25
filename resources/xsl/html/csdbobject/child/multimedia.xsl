<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

    <!-- Sudah di include di xsl lain -->

    <xsl:include href="./child/imfAddress.xsl" />

    <!-- CSS
        1. multimedia must be in center of display area 
        2. div.parameter harus hidden always
    -->

    <!-- JS
        1. ada element parameter yang diperlukan misal untuk video, dll
    -->

    <!-- OUTSTANDING
        1. untuk html tag embed, siapkan dulu fungsi php untuk mengambil extension pada ICN menggunakan ICNDocument class 
    -->

    <xsl:template match="multimediaAlts">
        <div class="multimediaAlts">
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="multimedia">
        <div class="multimedia">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:apply-templates>
                <xsl:with-param name="titleLevel">
                    <xsl:number count="multimedia" />
                </xsl:with-param>
            </xsl:apply-templates>
        </div>
    </xsl:template>

    <xsl:template match="multimediaObject">
        <div class="multimediaObject">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />

            <xsl:if test="@autoplay"><xsl:attribute name="autoplay"><xsl:value-of select="@autoplay" /></xsl:attribute></xsl:if>
            <xsl:if test="@fullScreen"><xsl:attribute name="fullScreen"><xsl:value-of
                        select="@fullScreen" /></xsl:attribute></xsl:if>
            <xsl:if test="@runTimeDuration"><xsl:attribute name="runTimeDuration"><xsl:value-of
                        select="@runTimeDuration" /></xsl:attribute></xsl:if>
            <xsl:if test="@showPluginControls"><xsl:attribute name="showPluginControls"><xsl:value-of
                        select="@runTimeDuration" /></xsl:attribute></xsl:if>

            <embed>
                <xsl:attribute name="src">
                    <xsl:value-of select="$base_uri" />
                    <xsl:text>/../</xsl:text>
                    <xsl:value-of select="unparsed-entity-uri(@infoEntityIdent)" />
                </xsl:attribute>

                <xsl:attribute name="type">
                    <xsl:choose>
                        <xsl:when test="@multimediaType">
                            <xsl:value-of select="string(@multimediaType)"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <!-- TBD, sementara masih pakai mime_content_type, selanjutnya pakai ICNDocument class php -->
                            <xsl:value-of select="php:function('mime_content_type', unparsed-entity-uri(@infoEntityIdent))"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>

                <xsl:if test="@multimediaObjectWidth">
                    <xsl:attribute name="width">
                    <xsl:value-of select="@multimediaObjectWidth" />
                    </xsl:attribute>
                </xsl:if>

                <xsl:if test="@multimediaObjectHeight">
                    <xsl:attribute name="height">
                    <xsl:value-of select="@multimediaObjectHeight" />
                    </xsl:attribute>
                </xsl:if>

                <xsl:if test="@runTimeDuration">
                    <xsl:attribute name="runTimeDuration">
                    <xsl:value-of select="@runTimeDuration" />
                    </xsl:attribute>
                </xsl:if>

                <xsl:if test="@showPluginControl">
                    <xsl:attribute name="showPluginControl">
                    <xsl:value-of select="@showPluginControl" />
                    </xsl:attribute>
                </xsl:if>
            </embed>

            <xsl:apply-templates select="parameter"/>
        </div>
    </xsl:template>

    <xsl:template match="parameter">
        <div class="parameter" id="{@id}">
                <xsl:if test="@parameterIdent">
                    <xsl:attribute name="parameterIdent">
                    <xsl:value-of select="@parameterIdent" />
                    </xsl:attribute>
                </xsl:if>            
                <xsl:if test="@parameterValue">
                    <xsl:attribute name="parameterValue">
                    <xsl:value-of select="@parameterValue" />
                    </xsl:attribute>
                </xsl:if>            
                <xsl:if test="@parameterName">
                    <xsl:attribute name="parameterName">
                    <xsl:value-of select="@parameterName" />
                    </xsl:attribute>
                </xsl:if>            
        </div>
    </xsl:template>
</xsl:stylesheet>