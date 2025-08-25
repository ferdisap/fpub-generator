<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="body">
        <xsl:param name="main_content" />
        <!-- <xsl:param name="navigation_content" /> -->
        
        <div class="header" id="header">
            <div class="title">
                <div class="title_left">
                    <a href="https://3dviewer.net" class="supportedby">
                        <span>Supported by </span>
                        <i class="icon icon-3dov-ferdi"></i>
                    </a>
                </div>
                <div class="main_file_name only_full_width" id="main_file_name"></div>
            </div>
            <div class="toolbar" id="toolbar"></div>
        </div>
        <div class="main" id="main">
                    <div class="main_left_container only_full_width" id="main_left_container">
                        <div class="main_navigator dm_panel_set_container" id="main_navigator"></div>
                        <div class="main_splitter" id="main_navigator_splitter"></div>
                    </div>
                    <div class="main_viewer" id="main_viewer">
                        <!-- untuk main content -->
                        <xsl:copy-of select="$main_content"/>
                        <!-- end of untuk main content -->
                    </div>
                    <div class="main_right_container only_full_width" id="main_right_container">
                        <div class="main_splitter" id="main_sidebar_splitter"></div>
                        <div class="main_sidebar dm_panel_set_right_container" id="main_sidebar"></div>
                    </div>
                </div>
        <div class="intro dm_thin_scrollbar" id="intro">
            <div class="intro_content" id="intro_content">
                <div class="intro_logo">
                    <img class="intro_logo" src="{concat($base, '/assets/logotext-512x512.png')}"
                        alt="F-Publication_logo" />
                    <div class="intro_dragdrop_text" id="intro_dragdrop_text"></div>
                </div>
                <div class="intro_formats">
                    <div class="intro_formats_title" id="intro_formats_title"></div>
                    <div class="intro_file_formats">
                        <div class="pmodule">
                            <div>Publication Module</div>
                            <a href="#DMC-.....xml">DMC-ABCD-EF-GH</a>
                            <a href="#DMC-.....xml">DMC-ABCD-EF-GH</a>
                            <a href="#DMC-.....xml">DMC-ABCD-EF-GH</a>
                            <a href="#DMC-.....xml">DMC-ABCD-EF-GH</a>
                        </div>
                        <div class="dmodule">
                            <div>Data Module Module</div>
                            <a href="#DMC-.....xml">DMC-ABCD-EF-GH</a>
                            <a href="#DMC-.....xml">DMC-ABCD-EF-GH</a>
                            <a href="#DMC-.....xml">DMC-ABCD-EF-GH</a>
                            <a href="#DMC-.....xml">DMC-ABCD-EF-GH</a>
                        </div>
                    </div>
                </div>
                <!-- intro footer start -->
                <!-- intro footer end -->
            </div>
        </div>

        <!-- untuk navigation content -->
        <!-- <xsl:copy-of select="$navigation_content"/> -->
        <!-- end of untuk navigation content -->

        <!-- untuk ident content -->
        <!-- <xsl:copy-of select="$navigation_content"/> -->
        <!-- end of untuk ident content -->

        <!-- untuk status content -->
        <!-- <xsl:copy-of select="$navigation_content"/> -->
        <!-- end of untuk status content -->

        <script type="module" src="{concat($base, '/index.js')}"></script>

    </xsl:template>
</xsl:stylesheet>