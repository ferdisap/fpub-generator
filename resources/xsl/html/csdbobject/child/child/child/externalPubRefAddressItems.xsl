<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="./child/externalPubIssueDate.xsl"/>
<xsl:include href="./child/pubMedia.xsl"/>
<xsl:include href="./child/shortExternalPubTitle.xsl"/>

<!-- sudah di include di xsl lain -->
<!-- <xsl:include href="responsiblePartnerCompany.xsl"/> -->
<!-- <xsl:include href="security.xsl"/> -->

  <xsl:template match="externalPubRefAddressItems">
    <span class="externalPubRefAddressItems">
      <xsl:apply-templates/>
    </span>
  </xsl:template>

</xsl:stylesheet>