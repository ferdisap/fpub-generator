<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl" xmlns:v-bind="https://vuejs.org/bind"
  xmlns:v-on="https://vuejs.org/on">

  <xsl:template match="dmIdent">
    <div class="dmIdent"> 
      <p>Below is Data module Ident:</p>
      <div>
        <b>Code</b>
        <ul>
          <li>modelIdentCode: <xsl:value-of select="dmCode/@modelIdentCode"/></li>
          <li>systemDiffCode: <xsl:value-of select="dmCode/@systemDiffCode"/></li>
          <li>systemCode: <xsl:value-of select="dmCode/@systemCode"/></li>
          <li>subSystemCode: <xsl:value-of select="dmCode/@subSystemCode"/></li>
          <li>subSubSystemCode: <xsl:value-of select="dmCode/@subSubSystemCode"/></li>
          <li>assyCode: <xsl:value-of select="dmCode/@assyCode"/></li>
          <li>disassyCode: <xsl:value-of select="dmCode/@disassyCode"/></li>
          <li>disassyCodeVariant: <xsl:value-of select="dmCode/@disassyCodeVariant"/></li>
          <li>infoCode: <xsl:value-of select="dmCode/@infoCode"/></li>
          <li>infoCodeVariant: <xsl:value-of select="dmCode/@infoCodeVariant"/></li>
          <li>itemLocationCode: <xsl:value-of select="dmCode/@itemLocationCode"/></li>
          <li>learnCode: <xsl:value-of select="dmCode/@learnCode"/></li>
          <li>learnEventCode: <xsl:value-of select="dmCode/@learnEventCode"/></li>
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