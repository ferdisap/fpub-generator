<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- <xsl:include href="symbol.xsl"/> -->
  <xsl:include href="./child/notePara.xsl" />
  <xsl:include href="./child/attentionSequentialList.xsl" />
  <xsl:include href="./child/attentionRandomList.xsl" />

  <xsl:template match="note">
    <div class="note">
      <xsl:call-template name="applicRefId" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:call-template name="id" />
      <xsl:call-template name="security" />
      <xsl:apply-templates />
    </div>
  </xsl:template>

</xsl:stylesheet>