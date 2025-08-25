<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="dmRefIdent.xsl"/> -->

    <xsl:template match="repositorySourceDmIdent">
        <div class="repositorySourceDmIdent">
            <xsl:call-template name="dmRefIdent"/>
        </div>
    </xsl:template>

    <!-- <xsl:template match="repositorySourceDmIdent">
        <div class="repositorySourceDmIdent">
            <xsl:variable name="dmRefIdent">
                <xsl:call-template name="dmRefIdent"/>
            </xsl:variable>
            <a href="{$dmRefIdent}"><xsl:value-of select="$dmRefIdent"/></a>
        </div>
    </xsl:template> -->

</xsl:stylesheet>