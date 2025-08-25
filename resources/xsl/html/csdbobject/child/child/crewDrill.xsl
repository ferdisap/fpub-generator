<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:php="http://php.net/xsl">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./child/warningAndCautionElemGroup.xsl" /> -->
    
    <xsl:template match="crewDrill">
        <div class="crewDrill">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:stylesheet>