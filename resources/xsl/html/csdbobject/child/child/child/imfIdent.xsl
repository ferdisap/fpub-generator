<?xml version="1.0" encoding="UTF-8"?>

<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:php="http://php.net/xsl" xmlns:v-bind="https://vuejs.org/bind"
  xmlns:v-on="https://vuejs.org/on">

  <xsl:template match="imfIdent">
    <div class="imfIdent"> 
      <p>Below is IMF Ident:</p>
      <div>
        <b>Code</b>
        <ul>
          <li>ident ICN: 
            <span class="imfIdentIcn">
              <xsl:value-of select="imfCode/@imfIdentIcn"/>
            </span>
          </li>
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