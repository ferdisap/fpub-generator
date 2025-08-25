<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- including yang sudah di add di xsl lain-->
    <!-- <xsl:include href="./child/applic.xsl" /> -->

    <!-- including yang umum digunakan karena berisi call template -->

    <xsl:template match="referencedApplicGroup">
        <div class="referencedApplicGroup">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
</xsl:transform>