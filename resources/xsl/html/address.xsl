<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="address">
        <div class="address">
            <xsl:apply-templates select="//identAndStatusSection/dmAddress/dmAddressItems | 
                                        //identAndStatusSection/pmAddress/pmAddressItems |
                                        //imfIdentAndStatusSection/imfAddress/imfAddressItems"/>
        </div>
    </xsl:template>

    <xsl:template match="dmAddressItems[ancestor::identAndStatusSection]">
        <div class="dmAddressItems">
            <p>Below is Address document:</p>
            <div>
                <b>Issue Date</b>
                <ul>
                    <li>
                        day:
                        <xsl:value-of select="issueDate/@day" />
                    </li>
                    <li>
                        month:
                        <xsl:value-of select="issueDate/@month" />
                    </li>
                    <li>
                        year:
                        <xsl:value-of select="issueDate/@year" />
                    </li>
                </ul>
            </div>
            <div>
                <b>Title</b>
                <ul>
                    <li>
                        Tech Name:
                        <xsl:value-of select="dmTitle/techName" />
                    </li>
                    <li>
                        Info Name:
                        <xsl:value-of select="dmTitle/infoName" />
                    </li>
                    <li>
                        Info Name Variant:
                        <xsl:value-of select="dmTitle/infoNameVariant" />
                    </li>
                </ul>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="pmAddressItems[ancestor::identAndStatusSection]">
        <div class="pmAddressItems">
            <p>Below is Address document:</p>
            <div>
                <b>Issue Date</b>
                <ul>
                    <li>
                        day:
                        <xsl:value-of select="issueDate/@day" />
                    </li>
                    <li>
                        month:
                        <xsl:value-of select="issueDate/@month" />
                    </li>
                    <li>
                        year:
                        <xsl:value-of select="issueDate/@year" />
                    </li>
                </ul>
            </div>
            <div>
                <b>Title</b>
                <ul>
                    <li>
                        PM Title:
                        <xsl:value-of select="pmTitle" />
                    </li>
                </ul>
            </div>
        </div>
    </xsl:template>

    <xsl:template match="imfAddressItems[ancestor::identAndStatusSection]">
        <div class="imfAddressItems">
            <xsl:text>TBD</xsl:text>
            <!-- <p>Below is Address document:</p>
            <div>
                <b>Issue Date</b>
                <ul>
                    <li>
                        day:
                        <xsl:value-of select="issueDate/@day" />
                    </li>
                    <li>
                        month:
                        <xsl:value-of select="issueDate/@month" />
                    </li>
                    <li>
                        year:
                        <xsl:value-of select="issueDate/@year" />
                    </li>
                </ul>
            </div>
            <div>
                <b>Title</b>
                <ul>
                    <li>
                        PM Title:
                        <xsl:value-of select="pmTitle" />
                    </li>
                </ul>
            </div> -->
        </div>
    </xsl:template>
</xsl:stylesheet>