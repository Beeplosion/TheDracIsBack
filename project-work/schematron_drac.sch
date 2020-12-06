<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <pattern>
        <rule context="date">
            <assert test="number(day) gt 0"/>
            <assert test="number(day) le 31"/>
        </rule>
        
        <rule context="date">
            <assert test="Month = ('January','February','March','April','May','June','July','August','September','October','November','December')"/>
            <assert test="@month = ('January','February','March','April','May','June','July','August','September','October','November','December')"/>
            
            <!-- needs fixed -->
        </rule>
        
        <rule context="chapter">
            <assert test="heading = ('CHAPTER I','CHAPTER II','CHAPTER III','CHAPTER IV','CHAPTER V','CHAPTER VI','CHAPTER VII','CHAPTER VIII','CHAPTER IX','CHAPTER X','CHAPTER XI','CHAPTER XII','CHAPTER XIII','CHAPTER XIV','CHAPTER XV','CHAPTER XVI','CHAPTER XVII','CHAPTER XVIII','CHAPTER XIX','CHAPTER XX','CHAPTER XXI','CHAPTER XXII','CHAPTER XXIII','CHAPTER XXIV','CHAPTER XXV','CHAPTER XXVI','CHAPTER XXVII')"/>    
        </rule>
        
        <rule context="char[@mina]">
            <!-- needs fixed -->
            <assert test="@mina = ('Mina','Mina Harker','Harker')"/>

        </rule>
        <rule context="char[@jonathan]">
            <assert test="@jonathan = ('Jonathan','Jonathan Harker','Harker','Mr. Harker','Harker Jonathan')"/>
            
        </rule>
        <rule context="char[@vanhelsing]">
            <assert test="@vanhelsing = ('Van Helsing','Abraham Van Helsing')"/>
            
        </rule>
        <rule context="char[@dracula]">
            <assert test="@dracula = ('Dracula','Count Dracula')"/>
            
        </rule>
        <rule context="char[@holmwood]">
            <assert test="@holmwood = ('Holmwood','Arthur','Arthur Holmwood')"/>
            
        </rule>
        <rule context="char[@lucy]">
            <assert test="@lucy = ('Lucy','Lucy Westenra','Westenra')"/>
            
        </rule>
        <rule context="char[@renfield]">
            <assert test="@renfield = ('R.M. Renfield','Renfield')"/>
            
        </rule>
        <rule context="char[@morris]">
            <assert test="@morris = ('Quincey P. Morris','Quincey Morris','Quincey','Morris')"/>
            
        </rule>
        <rule context="root">
            <assert test="title = ('D R A C U L A')"/>
            
        </rule>

    </pattern>
    
    
</sch:schema>