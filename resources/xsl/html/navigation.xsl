<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="navigation">
        <!-- <xsl:value-of select="local-name(./*)"/> -->
        <div class="navigation">
            <xsl:for-each select="//dmStatus/sourceDmIdent">
                <div class="sourceDmIdent">
                    <xsl:call-template name="dmRefIdent"/>
                </div>
            </xsl:for-each>
            <xsl:for-each select="//dmStatus/repositorySourceDmIdent">
                <div class="repositorySourceDmIdent">
                    <xsl:call-template name="dmRefIdent"/>
                </div>
            </xsl:for-each>
        </div>
    </xsl:template>
</xsl:stylesheet>