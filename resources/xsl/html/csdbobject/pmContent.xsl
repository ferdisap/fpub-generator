<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!-- sama dengan di content.xsl -->
    <!-- <xsl:template match="content[parent::pm]">
        <div class="content">
            <xsl:call-template name="id" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:apply-templates />
        </div>
    </xsl:template> -->

    <xsl:template match="pmEntry">
        <div class="pmEntry" pmEntryType="{@pmEntryType}">
            <xsl:call-template name="applicRefId" />
            <xsl:call-template name="changeAttribute" />
            <xsl:call-template name="security" />
            <xsl:call-template name="controlAuthorityRefs" />
            <xsl:apply-templates />
        </div>
    </xsl:template>

    <xsl:template match="pmEntryTitle">
        <div class="pmEntryTitle">
            <xsl:apply-templates />
        </div>
    </xsl:template>

</xsl:stylesheet>