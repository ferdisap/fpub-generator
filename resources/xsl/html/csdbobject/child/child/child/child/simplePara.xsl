<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./child/footnoteRef.xsl" /> -->
    <!-- <xsl:include href="./child/subOrSuperScriptElemGroup.xsl" /> -->

    <xsl:template match="simplePara">
        <p class="simplePara">
            <xsl:call-template name="applicRefId"/>
            <xsl:call-template name="controlAuthorityRefs"/>
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="id"/>
            <xsl:call-template name="security"/>
            <xsl:apply-templates/>
        </p>
    </xsl:template>

</xsl:stylesheet>