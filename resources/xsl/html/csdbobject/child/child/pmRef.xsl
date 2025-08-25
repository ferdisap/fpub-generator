<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:include href="./child/pmRefIdent.xsl" />
  <xsl:include href="./child/pmRefAddressItems.xsl" />
  <xsl:include href="./child/behavior.xsl" />


  <!-- CSS
    1. div.pm-list-container di hidden. Akan showed jika di klik a.pmRef
  -->

  <!-- JS
    1. div.pm-list-container.fetching-online akan diisi list data module yang dicari ke server 
  -->

  <xsl:template match="pmRef">
    <span class="pmRef">
      <xsl:call-template name="applicRefId" />
      <xsl:call-template name="changeAttribute" />
      <xsl:call-template name="id" />
      <xsl:call-template name="security" />
      <xsl:call-template name="controlAuthorityRefs" />
      <xsl:apply-templates select="behaviour" />

      <xsl:apply-templates select="pmRefIdent" />

      <xsl:if test="pmRefAddressItems">
        <xsl:text>&#160;</xsl:text>
        <xsl:apply-templates select="pmRefAddressItems" />
      </xsl:if>

      <!-- tidak diperlukan karena sekarang konsepnya yaitu semua sudah di generate html, tidak online runtime -->
      <!-- <div class="pm-list-container" referredFragment="{string(@referredFragment)}">
        <xsl:variable name="filename">
          <xsl:call-template name="resolvePMFilename">
            <xsl:with-param name="useExtension" select="boolean(0)" />
          </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="descendant::issueInfo and descendant::language">
            <div class="pm-list-container fetching-online" uncomplete-filename="{$filename}"></div>
          </xsl:when>
          <xsl:otherwise>
            <div class="pm-list-container">
              <ul>
                <li>
                  <a href="{$base_uri}/../{$filename}.{$module_extension}">
                    <xsl:value-of select="$filename" />
                    <xsl:value-of select="$module_extension" />
                  </a>
                </li>
              </ul>
            </div>
          </xsl:otherwise>
        </xsl:choose>
      </div> -->
      <!-- <xsl:choose>
        <xsl:when test="descendant::issueInfo and descendant::language">
          <xsl:variable name="uncompleteFilename">
            <xsl:call-template name="resolvePMFilename">
              <xsl:with-param name="useExtension" select="boolean(0)" />
            </xsl:call-template>
          </xsl:variable>
          <div
            class="pm-list-container" referredFragment="{string(@referredFragment)}"
            uncomplete-filename="{$uncompleteFilename}"></div>
        </xsl:when>
        <xsl:otherwise> </xsl:otherwise>
      </xsl:choose> -->

    </span>
  </xsl:template>

</xsl:stylesheet>