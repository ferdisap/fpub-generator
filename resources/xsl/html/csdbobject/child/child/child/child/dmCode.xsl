<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">

    <xsl:template match="dmCode">
        <xsl:variable name="modelIdentCode" select="@modelIdentCode"/>
        <xsl:variable name="systemDiffCode" select="@systemDiffCode"/>
        <xsl:variable name="sns">
            <xsl:value-of select="@systemCode"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@subSystemCode"/>
            <xsl:value-of select="@subSubSystemCode"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="@assyCode"/>
        </xsl:variable>
        <xsl:variable name="disassyCode" select="@disassyCode"/>
        <xsl:variable name="disassyCodeVariant" select="@disassyCodeVariant"/>
        <xsl:variable name="infoCode" select="@infoCode"/>
        <xsl:variable name="infoCodeVariant" select="@infoCodeVariant"/>
        <xsl:variable name="itemLocationCode" select="@itemLocationCode"/>
        <xsl:variable name="learnCode" select="@learnCode"/>
        <xsl:variable name="learnEventCode" select="@learnEventCode"/>

        <span class="dmCode">
            <xsl:value-of select="$modelIdentCode"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="$systemDiffCode"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="$sns"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="$disassyCode"/>
            <xsl:value-of select="$disassyCodeVariant"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="$infoCode"/>
            <xsl:value-of select="$infoCodeVariant"/>
            <xsl:text>-</xsl:text>
            <xsl:value-of select="$itemLocationCode"/>
            <xsl:if test="$learnCode and $learnEventCode">
                <xsl:text>-</xsl:text>
                <xsl:value-of select="$learnCode"/>
                <xsl:value-of select="$learnEventCode"/>
            </xsl:if>
        </span>
    </xsl:template>
        

</xsl:stylesheet>