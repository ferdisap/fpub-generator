<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="definitionList" /> -->

    <xsl:template match="legend">
        <div class="legend">
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:call-template name="id" />
            <xsl:call-template name="security" />
            <xsl:apply-templates/>
        </div>
    </xsl:template>

</xsl:stylesheet>