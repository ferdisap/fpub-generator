<?xml version="1.0" encoding="UTF-8"?>

<!-- xmlns:v-bind="https://vuejs.org/bind"
xmlns:v-on="https://vuejs.org/on" -->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl" >

  <!-- sudah di include di dmStatus -->
  <!-- <xsl:include href="./child/repositorySourceDmIdent.xsl" />
  <xsl:include href="./child/sourceDmIdent.xsl" />
  <xsl:include href="./child/controlAuthorityGroup.xsl" />
  <xsl:include href="./child/qualityAssurance.xsl" />
  <xsl:include href="./child/applic.xsl" />
  <xsl:include href="./child/reasonForUpdate.xsl" /> -->

  <xsl:template match="pmStatus">
    <div class="pmStatus">
      <xsl:call-template name="id"/>
      <xsl:if test="@issueType">
        <xsl:attribute name="issueType"><xsl:value-of select="@issueType"/></xsl:attribute>
      </xsl:if>
      <div>
        <ul>
          <li>
            Issue Type: <xsl:choose><xsl:when test="@issueType"><xsl:value-of select="@issueType"/></xsl:when><xsl:otherwise>-</xsl:otherwise></xsl:choose>
            <xsl:if test="reasonForUpdate">
              <div class="title">Reason for update:</div>
              <ol>
                <xsl:for-each select="reasonForUpdate">
                  <li>
                    <xsl:apply-templates select="."/>
                  </li>
                </xsl:for-each>
              </ol>
            </xsl:if>
          </li>
          <li>Source PM: <xsl:apply-templates select="sourcePmIdent"/></li>
          <li>Security: <xsl:apply-templates select="security"/></li>
          <li>Control A-A: <xsl:apply-templates select="controlAuthorityGroup"/></li>
          <!-- <li>Responsible Company: <xsl:value-of select="responsiblePartnerCompany/enterpriseName" />-<xsl:value-of select="responsiblePartnerCompany/@enterpriseCode" /></li> -->
          <li>Responsible Company: <xsl:apply-templates select="responsiblePartnerCompany"><xsl:with-param name="useTitle" select="boolean(0)"></xsl:with-param></xsl:apply-templates></li>
          <!-- <li>Originator Company: <xsl:value-of select="originator/enterpriseName" />-<xsl:value-of -->
          <li>Originator Company: <xsl:apply-templates select="originator"><xsl:with-param name="useTitle" select="boolean(0)"></xsl:with-param></xsl:apply-templates></li>
          <li>Applicability Document: 
            <!-- <a href="#">
              <xsl:value-of
                select="php:function('Ptdi\Mpub\Main\CSDBStatic::resolve_dmIdent', applicCrossRefTableRef/descendant::dmRefIdent, 'DMC-', '')" />
            </a> -->
            <xsl:apply-templates select="applicCrossRefTableRef/descendant::pmRefIdent"/>
          </li>
          <li>Applicability for:
             <!-- <xsl:value-of select="php:function('Ptdi\Mpub\Transformer\Html::getApplicability', $base_uri, applic)"/> -->
             <xsl:apply-templates select="applic"/>
          </li>
          <li>BREX Document: <a href="#">
              <xsl:value-of select="php:function('Ptdi\Mpub\Main\CSDBStatic::resolve_dmIdent', brexDmRef/descendant::dmRefIdent, 'DMC-', '')" />
            </a>
          </li>
          <li>
            <!-- Quality Assurance: <xsl:call-template name="getQualityAssurance" select="/"/> -->
            Quality Assurance: <xsl:apply-templates select="qualityAssurance"/>
          </li>
          <li>
            Remarks: <xsl:call-template name="getRemarksPm" select="/"/>
          </li>
        </ul>
      </div>
    </div>
  </xsl:template>

  <!-- <xsl:template name="getQualityAssurance">
    <xsl:for-each select="qualityAssurance">
      <span>
        <xsl:value-of select="@applicRefId" />
      </span>
      <xsl:text>|</xsl:text>
      <span>
        <xsl:value-of select="name(child::*)" />
      </span>
      <xsl:text>|</xsl:text>
      <span>
        <xsl:value-of select="child::*/@verificationType" />
      </span>
    </xsl:for-each>
  </xsl:template> -->

  <xsl:template name="getRemarksPm">
    <xsl:variable name="remarks">
      <xsl:for-each select="remarks/simplePara">
          <xsl:value-of select="string(.)"/>
          <xsl:text>\r\n</xsl:text>
        </xsl:for-each>
      </xsl:variable>
      <xsl:value-of select="php:function('trim', $remarks, '\n\r')"/>    
  </xsl:template>

</xsl:transform>