<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- CSS
    1.  beri garis atau tanda display bahwa ada perubahan pada text tersebut
  -->

  <xsl:include href="./child/accessPointRef.xsl"/>
  <xsl:include href="./child/caption.xsl"/>
  <xsl:include href="./child/circuitBreakerRef.xsl"/>
  <xsl:include href="./child/controlIndicatorRef.xsl"/>
  <xsl:include href="./child/functionalItemRef.xsl"/>
  <xsl:include href="./child/inlineSignificantData.xsl"/>
  <xsl:include href="./child/quantity.xsl"/>
  <xsl:include href="./child/zoneRef.xsl"/>
  <xsl:include href="./child/sequentialList.xsl"/>
  <xsl:include href="./child/randomList.xsl"/>
  <xsl:include href="./child/definitionList.xsl"/>

  <!-- dibawah ini adalah yang sudah di includekan di file lainnya -->
  <!-- <xsl:include href="./captionGroup.xsl"/> -->
  <!-- <xsl:include href="./identNumber.xsl"/> -->
  <!-- <xsl:include href="./internalRef.xsl"/> -->
  <!-- <xsl:include href="./indexFlag.xsl"/> -->
  <!-- <xsl:include href="./changeInline.xsl"/> -->
  <!-- <xsl:include href="./emphasis.xsl"/> -->
  <!-- <xsl:include href="./symbol.xsl"/> -->
  <!-- <xsl:include href="./subScript.xsl"/> -->
  <!-- <xsl:include href="./superScript.xsl"/> -->
  <!-- <xsl:include href="./dmRef.xsl"/> -->
  <!-- <xsl:include href="./pmRef.xsl"/> -->
  <!-- <xsl:include href="./externalPubRef.xsl"/> -->
  <!-- <xsl:include href="./footnote.xsl"/> -->
  <!-- <xsl:include href="./footnoteRef.xsl"/> -->
  <!-- <xsl:include href="./acronym.xsl"/> -->
  <!-- <xsl:include href="./acronymTerm.xsl"/> -->
  <!-- <xsl:include href="./verbatimText.xsl"/> -->

  <xsl:template match="changeInline">
    <span class="changeInline">
      <xsl:call-template name="id"/>
      <xsl:call-template name="changeAttribute"/>
      <xsl:call-template name="security"/>
      <xsl:call-template name="controlAuthorityRefs"/>
      <xsl:apply-templates/>      
    </span>
  </xsl:template>

</xsl:stylesheet>