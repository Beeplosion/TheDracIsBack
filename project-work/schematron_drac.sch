<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process"
    xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <pattern>
        <rule context="date">
            <assert test="number(day) gt 0"/>
            <assert test="number(day) le 31"/>
        </rule>
    </pattern>
    
    
</sch:schema>