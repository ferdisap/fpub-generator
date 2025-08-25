<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/dmRefIdent.xsl" />
  <xsl:include href="./child/dmRefAddressItems.xsl" />
  <xsl:include href="./child/behavior.xsl" />

  <!-- CSS
    1. div.dm-list-container di hidden. Akan showed jika di klik a.dmRef
  -->

  <!-- JS
    1. div.dm-list-container.fetching-online akan diisi list data module yang dicari ke server 
  -->

  <xsl:template match="dmRef">
    <span class="dmRef">
      <xsl:call-template name="applicRefId" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="id" />
      <xsl:call-template name="security" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:apply-templates select="behaviour" />

      <xsl:apply-templates select="dmRefIdent" />

      <xsl:if test="dmRefAddressItems">
        <xsl:text>&#160;</xsl:text>
        <xsl:apply-templates select="dmRefAddressItems" />
      </xsl:if>

      <!-- tidak diperlukan karena sekarang konsepnya yaitu semua sudah di generate html, tidak online runtime -->
      <!-- <div class="dm-list-container" referredFragment="{string(@referredFragment)}">
        <xsl:variable name="filename">
          <xsl:call-template name="resolveDMFilename">
            <xsl:with-param name="useExtension" select="boolean(0)" />
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="descendant::issueInfo and descendant::language">
            <div class="dm-list-container fetching-online" uncomplete-filename="{$filename}"></div>
          </xsl:when>
          <xsl:otherwise>
            <div class="dm-list-container">
              <ul>
                <li>
                  <a href="{$base_uri}/../{$filename}.{$module_extension}"><xsl:value-of select="$filename"/><xsl:value-of select="$module_extension"/></a>
                </li>
              </ul>
            </div>
          </xsl:otherwise>
        </xsl:choose>
      </div> -->
      <!-- <xsl:choose>
        <xsl:when test="boolean(descendant::issueInfo) and boolean(descendant::language)">
          <xsl:variable name="uncompleteFilename">
            <xsl:call-template name="resolveDMFilename">
              <xsl:with-param name="useExtension" select="boolean(0)" />
            </xsl:call-template>
          </xsl:variable>
          <div
            class="dm-list-container" referredFragment="{string(@referredFragment)}"
            uncomplete-filename="{$uncompleteFilename}"></div>
        </xsl:when>
        <xsl:otherwise> </xsl:otherwise>
      </xsl:choose> -->

    </span>
  </xsl:template>

</xsl:stylesheet>