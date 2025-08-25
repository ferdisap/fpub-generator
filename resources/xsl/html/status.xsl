<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="./dmStatus" /> -->

    <xsl:template name="status">
        <div class="status">
            <!-- <xsl:apply-templates select="./*/child::*[1]/descendant::dmStatus | ./*/child::*[1]/descendant::pmStatus" /> -->
            <xsl:apply-templates select="./*/child::*[1]/descendant::dmStatus | ./*/child::*[1]/descendant::pmStatus" />
        </div>
    </xsl:template>
</xsl:stylesheet>