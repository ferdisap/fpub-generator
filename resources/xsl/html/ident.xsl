<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="ident">
        <div class="ident">
            <xsl:apply-templates select="
            ./*/child::*[1]/descendant::dmIdent | 
            ./*/child::*[1]/descendant::pmIdent | 
            ./*/child::*[1]/descendant::imfIdent
            " />
        </div>
        <!-- <div class="ident">
            <xsl:apply-templates select="./*/child::*[1]/descendant::dmIdent" />
        </div> -->
    </xsl:template>
</xsl:stylesheet>