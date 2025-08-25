<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template match="pmIdent">
    <div class="pmIdent"> 
      <p>Below is Publication module Ident:</p>
      <div>
        <b>Code</b>
        <ul>
          <li>modelIdentCode: <xsl:value-of select="pmCode/@modelIdentCode"/></li>
          <li>pmIssuer: <xsl:value-of select="pmCode/@pmIssuer"/></li>
          <li>pmNumber: <xsl:value-of select="pmCode/@pmNumber"/></li>
          <li>pmVolume: <xsl:value-of select="pmCode/@pmVolume"/></li>
        </ul>
      </div>
      <div>
        <b>Language</b>
        <ul>
          <li>countryIsoCode: <xsl:value-of select="language/@countryIsoCode"/></li>
          <li>languageIsoCode: <xsl:value-of select="language/@languageIsoCode"/></li>
        </ul>
      </div>
      <div>
        <b>Issue Info</b>
        <ul>
          <li>inWork: <xsl:value-of select="issueInfo/@inWork"/></li>
          <li>issueNumber: <xsl:value-of select="issueInfo/@issueNumber"/></li>
        </ul>
      </div>
    </div>
  </xsl:template>

</xsl:transform>