<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./child/footnoteRef.xsl" /> -->

    <xsl:include href="./child/simplePara.xsl" />

    <xsl:template match="footnoteRemarks">
        <span class="footnoteRemarks">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:apply-templates/>
        </span>
    </xsl:template>

</xsl:stylesheet>