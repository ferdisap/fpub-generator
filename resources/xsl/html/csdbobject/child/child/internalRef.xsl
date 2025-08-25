<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Sebelum render page, lebih baik di clear kan \n\t nya agar spasi numbering tiadk kacau saat human read-->
  
  <!-- sudah di include di xsl lain -->
  <!-- <xsl:include href="./child/subOrSuperScriptElemGroupStyle.xsl"/> -->

<!-- CSS
  1. div.external-doc adalah hidden container uri berisi uri+fragment untuk external document (comrep)
  2. div.external-doc display fixed karena view akan scroller ke @internalRefId jika ada
-->

<!-- JS
  1. div.external-doc akan showed jika onclick dan akan hide jika di 'esc' atau outside click
-->

<xsl:template match="internalRef">  
  <!-- 
    1. tampilkan tootltip text berupa @targetTitle
    3. irtt11 (hotspot) style will be made later, karena belum terlalu paham dengan <webcgm>
    3. irtt12 (parameter) style will be made later, karena belum memerlukan

    ex. output >>> "Fig. 1 Internal Ref Text" (tanpa tooltip)
   -->

   <!-- calling template irrt (FIG. 01 TABLE. 01, etc) -->
   <a class="internalRef" href="#">
    <xsl:call-template name="internalRefId"/>
    <!-- Tooltip trigger target view -->
    <xsl:if test="@targetTitle">
      <xsl:attribute name="targetTitle">
        <xsl:value-of select="@targetTitle"/>
      </xsl:attribute>
    </xsl:if>     
    <xsl:if test="@internalRefTargetType">
      <xsl:attribute name="internalRefTargetType">
        <xsl:value-of select="@internalRefTargetType"/>
      </xsl:attribute>
      <xsl:call-template name="irtt"/>
    </xsl:if>
    <xsl:apply-templates/> 
   </a>
</xsl:template>

<!-- get the view Prefix and Number, eg. Fig. 1, Fig. 2-->
<xsl:template name="irtt">
  <xsl:choose>
    <xsl:when test="@internalRefTargetType = 'irtt01'">
      <xsl:text>Fig.&#160;</xsl:text>
      <xsl:call-template name="getPosition">
        <xsl:with-param name="xpath" select="//figure"/>
        <xsl:with-param name="idCompared" select="@internalRefId"/>
      </xsl:call-template>
      <xsl:text>&#160;</xsl:text>
      <xsl:apply-templates/> <!-- Text inside <internalRef> -->
    </xsl:when>
    
    <xsl:when test="@internalRefTargetType = 'irtt02'">
      <xsl:text>Table.&#160;</xsl:text>
      <xsl:call-template name="getPosition">
        <xsl:with-param name="xpath" select="//table"/>
        <xsl:with-param name="idCompared" select="@internalRefId"/>
      </xsl:call-template>
      <xsl:text>&#160;</xsl:text>
      <xsl:apply-templates/> <!-- Text inside <internalRef> -->
    </xsl:when>

    <xsl:when test="@internalRefTargetType = 'irtt03'">
      <xsl:text>Mma.&#160;</xsl:text>
      <xsl:call-template name="getPosition">
        <xsl:with-param name="xpath" select="//multimedia"/>
        <xsl:with-param name="idCompared" select="@internalRefId"/>
      </xsl:call-template>
      <xsl:text>&#160;</xsl:text>
      <xsl:apply-templates/> <!-- Text inside <internalRef> -->
    </xsl:when>

    <xsl:when test="@internalRefTargetType = 'irtt04'">
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:choose>
        <xsl:when test="boolean(//supplyDesc[@id = $internalRefId]/shortName)">
          <xsl:apply-templates select="//supplyDesc[@id = $internalRefId]/shortName"/>
        </xsl:when>
        <xsl:when test="boolean(//supplyDesc[@id = $internalRefId]/name)">
          <xsl:apply-templates select="//supplyDesc[@id = $internalRefId]/name"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>

    <xsl:when test="@internalRefTargetType = 'irtt05'">
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:choose>
        <xsl:when test="boolean(//supportEquipDescr[@id = $internalRefId]/shortName)">
          <xsl:apply-templates select="//supportEquipDescr[@id = $internalRefId]/shortName"/>
        </xsl:when>
        <xsl:when test="boolean(//supportEquipDescr[@id = $internalRefId]/name)">
          <xsl:apply-templates select="//supportEquipDescr[@id = $internalRefId]/name"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>

    <xsl:when test="@internalRefTargetType = 'irtt06'">
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:choose>
        <xsl:when test="boolean(//spareDescr[@id = $internalRefId]/shortName)">
          <xsl:apply-templates select="//spareDescr[@id = $internalRefId]/shortName"/>
        </xsl:when>
        <xsl:when test="boolean(//spareDescr[@id = $internalRefId]/name)">
          <xsl:apply-templates select="//spareDescr[@id = $internalRefId]/name"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:when>

    <xsl:when test="@internalRefTargetType = 'irtt07'">
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:variable name="parentName" select="string(name(parent::*))"/>

      <xsl:if test="$parentName = 'levelledPara'">
        <xsl:text>Para.&#160;</xsl:text>
        <xsl:call-template name="getPosition">
          <xsl:with-param name="xpath" select="//levelledPara"/>
          <xsl:with-param name="idCompared" select="$internalRefId"/>
          <xsl:with-param name="includedParent" select="'yes'"/>
          <xsl:with-param name="parentName" select="$parentName"/>
        </xsl:call-template>
        <xsl:text>&#160;</xsl:text>
      </xsl:if>
      <xsl:apply-templates/>
    </xsl:when>

    <xsl:when test="@internalRefTargetType = 'irtt08'">
      <xsl:text>Step.&#160;</xsl:text>
      <xsl:call-template name="getPosition">
        <xsl:with-param name="xpath" select="//proceduralStep"/>
      </xsl:call-template>
      <xsl:text>&#160;</xsl:text>
      <xsl:apply-templates/>
    </xsl:when>

    <xsl:when test="@internalRefTargetType = 'irtt09'">
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:text>Fig.&#160;</xsl:text>
      <xsl:call-template name="getPositionGraphic">
        <xsl:with-param name="xpath" select="//graphic[@id = $internalRefId]/.."/>
        <xsl:with-param name="compared" select="//graphic[@id = $internalRefId]/.."/>
      </xsl:call-template>
      <xsl:text>&#160;</xsl:text>
      <xsl:apply-templates/>
    </xsl:when>
    
    <xsl:when test="@internalRefTargetType = 'irtt10'">
      <!-- Decide Prefix Name of multimedia (3D. X....) -->
      <xsl:call-template name="multimediaTypePrefix"/>
      <!-- get the position of multimediaObject -->
      <xsl:text>&#160;</xsl:text>
      <xsl:call-template name="getPosition">
        <xsl:with-param name="xpath" select="//multimediaObject"/>
        <xsl:with-param name="idCompared" select="string(@internalRefId)"/>
      </xsl:call-template>
      <xsl:text>&#160;</xsl:text>
      <!-- Text inside <internalRef> -->
      <xsl:apply-templates/> 
    </xsl:when>

    <!-- <hotspot> belum dipakai -->
    <xsl:when test="@internalRefTargetType = 'irtt11'">
    </xsl:when>

    <!-- <multimedia> parameter belum dipakai -->
    <xsl:when test="@internalRefTargetType = 'irtt12'">
    </xsl:when>

    <!-- <zoneRef> karena kalau <zone> hanya ada di comrep dan update xsd -->
    <xsl:when test="@internalRefTargetType = 'irtt13'">
      <div class="external-doc">
        <a>
          <xsl:attribute name="href">
            <xsl:call-template name="get_repositorySourceDmIdent_uri">
              <xsl:with-param name="type">zone</xsl:with-param>
            </xsl:call-template>
            <xsl:text>#</xsl:text>
            <xsl:value-of select="string(@referredFragment)"/>
          </xsl:attribute>
        </a>
      </div>
      <xsl:text>Zone&#160;</xsl:text>
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:apply-templates select="//zoneRef[@id = $internalRefId]/name | //zoneRef[@id = $internalRefId]/shortName | ."/>
    </xsl:when>

    <!-- <workLocation> -->
    <xsl:when test="@internalRefTargetType = 'irtt14'">        
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:apply-templates select="//workLocation[@id = $internalRefId]/workArea"/>
    </xsl:when>

    <!-- sb -->
    <xsl:when test="@internalRefTargetType = 'irtt15'">
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:apply-templates select="//sbmaterialSet[@id = $internalRefId]/shortName | 
        //sbSupportEquipSet[@id = $internalRefId]/shortName |
        //sbIndividualSupportEquip[@id = $internalRefId]/shortName |
        //sbExternalSupportEquipSet[@id = $internalRefId]/shortName |
        //sbSupplySet[@id = $internalRefId]/shortName |
        //sbIndividualSupply[@id = $internalRefId]/shortName |
        //sbExternalSupplySet[@id = $internalRefId]/shortName |
        //sbSpareSet[@id = $internalRefId]/shortName |
        //sbIndividualSpare[@id = $internalRefId]/shortName |
        //sbExternalSpareSet[@id = $internalRefId]/shortName |
        //sbRemovedSpareSet[@id = $internalRefId]/shortName |
        //sbIndividualRemovedSpareSet[@id = $internalRefId]/shortName | ."/>
    </xsl:when>

    <!-- <accessPointRef> -->
    <xsl:when test="@internalRefTargetType = 'irtt16'">
      <div class="external-doc">
        <a>
          <xsl:attribute name="href">
            <xsl:call-template name="get_repositorySourceDmIdent_uri">
              <xsl:with-param name="type">accessPoint</xsl:with-param>
            </xsl:call-template>
            <xsl:text>#</xsl:text>
            <xsl:value-of select="string(@referredFragment)"/>
          </xsl:attribute>
        </a>
      </div>
      <xsl:variable name="internalRefId" select="string(@internalRefId)"/>
      <xsl:apply-templates select="//accessPointRef[@id = $internalRefId]/name | ."/>
    </xsl:when>

    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
  </xsl:choose>    
</xsl:template>


<!-- TEMPLATE Helper, lihat demo5.xml/demo5.xsl -->
<!-- TEMPLATE Helper, lihat demo5.xml/demo5.xsl -->
<!-- TEMPLATE Helper, lihat demo5.xml/demo5.xsl -->
<!-- TEMPLATE Helper, lihat demo5.xml/demo5.xsl -->
<!-- TEMPLATE Helper, lihat demo5.xml/demo5.xsl -->
<!-- TEMPLATE Helper, lihat demo5.xml/demo5.xsl -->

<xsl:template name="multimediaTypePrefix">
  <xsl:choose>
    <xsl:when test="//multimediaObject/@multimediaType = '3D'">3D.</xsl:when>
    <xsl:when test="//multimediaObject/@multimediaType = 'audio'">Audio.</xsl:when>
    <xsl:when test="//multimediaObject/@multimediaType = 'video'">Video.</xsl:when>
    <xsl:otherwise>Any.</xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- function ini telah diubah, coba cek dulu pakai yang lama Refer to demo5.xsl/demo5.xml 02,  -->
<xsl:template name="getPosition">
  <xsl:param name="xpath"/>
  <xsl:param name="idCompared"/>
  <xsl:param name="includedParent" select="no"/>
  <xsl:param name="parentName" select="'levelledPara'"/>
  <xsl:for-each select="$xpath">
    <xsl:if test="@id = $idCompared">
      <xsl:if test="$includedParent = 'yes'">
        <xsl:call-template name="checkParent"><xsl:with-param name="parentName" select="$parentName"/></xsl:call-template>
      </xsl:if><xsl:number/>
    </xsl:if>
  </xsl:for-each>
</xsl:template>

<xsl:template name="checkParent">
  <xsl:param name="parentName" select="'levelledPara'"/>
  <xsl:if test="name(parent::*) = $parentName">
    <xsl:call-template name="getParentPosition">
      <xsl:with-param name="parentName" select="$parentName"/>
    </xsl:call-template>.
  </xsl:if>
</xsl:template>

<xsl:template name="getParentPosition">
  <xsl:param name="compared" select=".."/>
  <xsl:param name="parentName" select="'levelledPara'"/>
  <xsl:if test="$parentName = 'levelledPara'">
    <xsl:for-each select="../../levelledPara">
      <xsl:if test=". = $compared">
        <xsl:call-template name="checkParent">
          <xsl:with-param name="parentName" select="$parentName"/>
        </xsl:call-template><xsl:number/>
      </xsl:if>
    </xsl:for-each>
  </xsl:if>
</xsl:template>
<!-- end of Refer to demo5.xsl/demo5.xml 02 -->

<!-- Refer to demo5.xsl/demo5.xml 03 -->
<xsl:template name="getPositionGraphic">
  <xsl:param name="xpath"/>
  <xsl:param name="compared"/>
  <xsl:for-each select="$xpath">
    <xsl:if test=". = $compared">
      <xsl:number/>&#160;sheet&#160;<xsl:call-template name="getPosition">
        <xsl:with-param name="xpath" select="//graphic"/>
        <xsl:with-param name="idCompared" select="'gra-002'"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:for-each>
</xsl:template>
<!-- end of Refer to demo5.xsl/demo5.xml 03 -->

<!-- untuk refer ke data external module -->
 <xsl:template name="get_repositorySourceDmIdent_uri">
   <xsl:param name="type"></xsl:param>

   <xsl:for-each select="//repositorySourceDmIdent">
      <xsl:variable name="filename">
        <xsl:call-template name="resolveDMFilename">
          <xsl:with-param name="useExtension" select="boolean(1)"/>
        </xsl:call-template>
      </xsl:variable>
      <xsl:variable name="uri" select="concat($base_uri, '/../', $filename)"/>
      <xsl:variable name="result">
        <xsl:choose>
          <xsl:when test="type = 'accessPoint'">
            <xsl:if test="boolean(document($uri)//accessPointRepository/accessPointSpec/accessPointIdent/@accessPointNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'applic'">
            <xsl:if test="boolean(document($uri)//applicRepository/applicSpec/applicIdent/@applicNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'circuitBreaker'">
            <xsl:if test="boolean(document($uri)//circuitBreakerRepository/circuitBreakerSpec/circuitBreakerIdent/@circuitBreakerNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'caution'">
            <xsl:if test="boolean(document($uri)//cautionRepository/cautionSpec/cautionIdent/@cautionNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'controlIndicator'">
            <xsl:if test="boolean(document($uri)//controlIndicatorRepository/controlIndicatorSpec/controlIndicatorIdent/@controlIndicatorNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'enterprise'">
            <xsl:if test="boolean(document($uri)//enterpriseRepository/enterpriseSpec/enterpriseIdent/@enterpriseNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'functionalItem'">
            <xsl:if test="boolean(document($uri)//functionalItemRepository/functionalItemSpec/functionalItemIdent/@functionalItemNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>          
          <xsl:when test="type = 'functionalPhysicalArea'">
            <xsl:if test="boolean(document($uri)//functionalPhysicalAreaRepository/functionalPhysicalAreaSpec/functionalPhysicalAreaIdent/@functionalPhysicalAreaNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'part'">
            <xsl:if test="boolean(document($uri)//partRepository/partSpec/partIdent/@partNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'tool'">
            <xsl:if test="boolean(document($uri)//toolRepository/toolSpec/toolIdent/@toolNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'supply'">
            <xsl:if test="boolean(document($uri)//supplyRepository/supplySpec/supplyIdent/@supplyNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'supplyRqmt'">
            <xsl:if test="boolean(document($uri)//supplyRqmtRepository/supplyRqmtSpec/supplyRqmtIdent/@supplyRqmtNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'warning'">
            <xsl:if test="boolean(document($uri)//warningRepository/warningSpec/warningIdent/@warningNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:when test="type = 'zone'">
            <xsl:if test="boolean(document($uri)//zoneRepository/zoneSpec/zoneIdent/@zoneNumber)">
              <xsl:value-of select="$uri"/>
            </xsl:if>
          </xsl:when>
          <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:value-of select="$result"/>
    </xsl:for-each>
 </xsl:template>


</xsl:stylesheet>