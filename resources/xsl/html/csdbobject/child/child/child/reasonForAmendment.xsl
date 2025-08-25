<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Sudah di include di xsl lain -->
    <!-- <xsl:include href="textElemGroupStyle.xsl"/> -->

    <!-- CSS
    1. untuk reasonForAmandment akan dibuat semacam dropdown atau modal untuk keterangan ini
  -->

    <xsl:template match="reasonForAmandment">
        <div class="reasonForAmandment">
            <div><a href="#" class="clickbait-reasonForAmandment">See the reason for icn amandment here.</a></div>
            <div class="details-reasonForAmandment">
                <xsl:call-template name="applicRefId" />
                <xsl:call-template name="controlAuthorityRefs" />
                <xsl:apply-templates />
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>