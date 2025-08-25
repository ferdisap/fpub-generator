<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./child/para.xsl" /> -->
    <!-- <xsl:include href="./child/caption.xsl" /> -->

    <!-- Sudah di include di xsl content.xsl -->
    <!-- including default -->
    <!-- <xsl:include href="./child/fmftElemGroup.xsl" />
    <xsl:include href="./child/attentionElemGroup.xsl" />
    <xsl:include href="./child/textElemGroupStyle.xsl" />
    <xsl:include href="./child/warningAndCautionElemGroup.xsl" /> -->
    <!-- <xsl:include href="./child/subOrSuperScriptElemGroupStyle.xsl" /> -->
    <!-- <xsl:include href="./child/child/table.xsl" /> -->
    
    <!-- Sudah di include di xsl content.xsl -->
    <!-- including yang umum digunakan karena berisi call template -->
    <!-- <xsl:include href="./child/applicRefId.xsl" />
    <xsl:include href="./child/controlAuthorityRefs.xsl" />
    <xsl:include href="./child/enterpriseName.xsl" />
    <xsl:include href="./child/id.xsl" />
    <xsl:include href="./child/internalRefId.xsl" />
    <xsl:include href="./child/identAndStatusSection.xsl" />
    <xsl:include href="./child/responsiblePartnerCompany.xsl" />
    <xsl:include href="./child/security.xsl" /> -->
    
    <xsl:include href="./child/levelledPara.xsl" />
    <xsl:include href="./child/levelledParaAlts.xsl" />
    <xsl:include href="./child/figure.xsl" />
    <xsl:include href="./child/multimedia.xsl" />
    <!-- <xsl:include href="./child/foldout.xsl" /> -->

    <xsl:template match="description">
        <xsl:call-template name="warningRefs"/>
        <xsl:call-template name="cautionRefs"/>        
        <div class="description">
            <xsl:apply-templates/>
        </div>
    </xsl:template>




</xsl:stylesheet>