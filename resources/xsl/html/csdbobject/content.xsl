<?xml version="1.0" encoding="UTF-8"?>
<!-- xmlns:php="http://php.net/xsl" -->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- including default -->
    <xsl:include href="./child/fmftElemGroup.xsl" />
    <xsl:include href="./child/attentionElemGroup.xsl" /> 
    <xsl:include href="./child/textElemGroupStyle.xsl" /> 
    <xsl:include href="./child/normalParaElemGroup.xsl" />
    <xsl:include href="./child/warningAndCautionElemGroup.xsl" />
    <xsl:include href="./child/subOrSuperScriptElemGroupStyle.xsl" />
    <xsl:include href="./child/referenceApplicGroup.xsl" />

    <!-- including yang umum digunakan karena berisi call template -->
    <xsl:include href="./child/applicRefId.xsl" />
    <xsl:include href="./child/controlAuthorityRefs.xsl" />
    <xsl:include href="./child/change.xsl" />
    <xsl:include href="./child/enterpriseName.xsl" />
    <xsl:include href="./child/id.xsl" />
    <xsl:include href="./child/internalRefId.xsl" />
    <xsl:include href="./child/identAndStatusSection.xsl" />
    <xsl:include href="./child/responsiblePartnerCompany.xsl" />
    <xsl:include href="./child/security.xsl" />

    <xsl:include href="./description.xsl" />
    <xsl:include href="./imfContent.xsl" />
    <xsl:include href="./pmContent.xsl" />

    <xsl:template match="content">
        <div class="content">
            <xsl:call-template name="id"/>
            <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:transform>