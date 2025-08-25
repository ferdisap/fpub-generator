<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="./child/externalPubCode.xsl"/>
<xsl:include href="./child/externalPubTitle.xsl"/>
<xsl:include href="./child/externalPubIssueInfo.xsl"/>

  <xsl:template match="externalPubRefIdent">
    <xsl:param name="referredFragment" select="parent::externalPubRef/@referredFragment"/>
    <a href="#" referredFragment="{$referredFragment}" class="externalPubRefIdent">
      <xsl:apply-templates/>
    </a>
  </xsl:template>

</xsl:stylesheet>