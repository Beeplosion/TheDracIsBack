<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="3.0"
    xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>
    
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Dracula</title>
                <link rel="stylesheet" type="text/css" href="DRACULA CSS.css"/>
            </head>
            <body>
                <h1 id="top"><xsl:apply-templates select="descendant::title"/></h1>
                
             
                <table> 
                    <tr>
                        <th>Chapter Number</th>
                        <th>Locations mentioned</th>
                        <th>Tech mentioned</th>
                    </tr>
                    <xsl:apply-templates select="descendant::chapter" mode="toc"/>
                    
                    
                </table>
                
                <xsl:apply-templates select="descendant::chapter"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="chapter" mode="toc" >
        <tr>
            <td><a href="#C{preceding::heading => count()+1}"><xsl:apply-templates select="descendant::heading"/></a></td>
            <td><xsl:apply-templates select="descendant::location => distinct-values()=> string-join(', ')"/></td>
            <td><xsl:apply-templates select="descendant::tech ! normalize-space() => distinct-values() => string-join(', ') "/></td>
        </tr>
    </xsl:template>
    <xsl:template match="chapter">
        <a href="#top"><h2 id="C{preceding::heading => count()+1}"><xsl:apply-templates select="descendant::heading"/></h2></a>
        <xsl:apply-templates select="descendant::p"/>
    </xsl:template>
    <xsl:template match="p">
        <p> <xsl:apply-templates/></p>
    </xsl:template>
    <xsl:template match="location">
        <span class="location"><xsl:apply-templates/></span>
        
    </xsl:template>
    <xsl:template match="tech">
        <span class="tech"><xsl:apply-templates/></span>
    </xsl:template>
    <xsl:template match="h2" mode="toc">
        <li>
            <a href="#{@id}">
                <xsl:apply-templates select="@id"/>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>