<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:output method="text" encoding="UTF-8"/>
    
    <!--ebb: We're doing "pull-processing" (which means excluding most of the novel from the results, 
    and just getting what we need.)-->
    
    <xsl:variable name="chars" as="xs:string+" select="//char/@name ! normalize-space() => distinct-values()"/>
    
    <xsl:variable name="tab" as="xs:string" select="'&#x9;'"/>
    <xsl:variable name="lineFeed" as="xs:string" select="'&#10;'"/>
    <xsl:variable name="DracFile" as="document-node()" select="document('Dracula.xml')"/>
    
    <xsl:template match="/">
        
        <xsl:for-each select="$chars">
            <xsl:variable name="currentChar" as="xs:string" select="current()"/>
            
            <xsl:for-each select="$DracFile//p[descendant::char[@name=current()] and descendant::tech]">
                <xsl:variable name="currentPar" as="element()" select="current()"/>
                <xsl:variable name="currentTech" as="xs:string+" select="$currentPar//tech/@type ! normalize-space() => distinct-values()"/>
                
             <xsl:for-each select="$currentTech">  
                 
                 <xsl:value-of select="$currentChar"/><xsl:value-of select="$tab"/>
                
                <xsl:text>which chapter?</xsl:text><xsl:value-of select="$tab"/>
                <xsl:value-of select="$currentPar/ancestor::chapter/heading ! substring-after(., 'CHAPTER ') "/>
                <xsl:value-of select="$tab"/>
     
                <xsl:value-of select="'P-' || count($currentPar/preceding::p) + 1"/>
                <xsl:value-of select="$tab"/>
                
               <xsl:value-of select="current()"/><!--current technology -->
                <xsl:value-of select="$tab"/>
                 <xsl:value-of select="$lineFeed"/>
            </xsl:for-each>

            </xsl:for-each>
           
        </xsl:for-each>
        
    
    </xsl:template>
    
    
    
</xsl:stylesheet>