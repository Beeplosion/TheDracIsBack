<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="/">
        <html>
            <head>
                
                <h1>
                    Dracula
                </h1>
            </head>
            <body>
                <xsl:apply-templates select="descendant::chapter"/>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="chapter">
        <h2><xsl:apply-templates select="descendant::heading"/></h2>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="p">
        <p> <xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="location">
        <span class="location"><xsl:apply-templates/></span>
    </xsl:template>
</xsl:stylesheet>