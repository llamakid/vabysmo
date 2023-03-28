<?xml version="1.0" encoding="us-ascii"?>
<!-- Copyright (c) 2010, Pragmatic Data LLC. All rights reserved. CONFIDENTIAL. -->
<xsl:transform version="1.0" 
	       xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	       xmlns:v3="urn:hl7-org:v3" 
	       exclude-result-prefixes="v3 xsl">
   <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
   <xsl:strip-space elements="*"/>

   <xsl:param name="core-base-url" select="'./core'"/>
   
   <!-- MODE: default - this is only grabbing the entry if run in standalone mode, if imported importer template overrides -->
   <xsl:template match="/">
      <xsl:apply-templates mode="mixin" select="."/>
   </xsl:template>
   <xsl:variable name="root" select="/"/>
   <xsl:variable name="base-document-ref" select="/*/v3:relatedDocument[@typeCode='APND'][1]/v3:relatedDocument"/>
   <xsl:variable name="base-document-id" select="$base-document-ref/*[self::v3:id or self::v3:setId][1]/@root"/>
   <xsl:variable name="base-document-path" select="concat($core-base-url,'/',$base-document-id)"/>
   <xsl:variable name="base-document-url" select="concat($base-document-path,'/',$base-document-id,'.xml')"/>

   <!-- MODE: mixin - where we initiate the new document and may later switch to base document and come back here for new content -->
   <xsl:template mode="mixin" match="/|@*|node()">
      <xsl:copy>
	 <xsl:apply-templates mode="mixin" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template mode="mixin" match="processing-instruction()" priority="0"/>
   <xsl:template mode="mixin" match="/*[v3:relatedDocument[@typeCode='APND' and v3:relatedDocument/*[self::v3:id or self::v3:setId]/@root]]/v3:component/v3:structuredBody">
      <xsl:variable name="base-document" select="document($base-document-url)"/>
      <xsl:apply-templates mode="mixin-base" select="$base-document"/>
   </xsl:template>

   <!-- MODE: mixin-base - where we output the base document with the replaced things from new document weaved in -->
   <xsl:template mode="mixin-base" match="/|@*|node()">
      <xsl:copy>
	 <xsl:apply-templates mode="mixin-base" select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
   <xsl:template mode="mixin-base" match="processing-instruction()|/*/*[not(self::v3:component)]" priority="0"/>
   <xsl:template mode="mixin-base" match="v3:observationMedia/v3:value/v3:reference/@value">
      <xsl:attribute name="{local-name(.)}" namespace="{namespace-uri(.)}">
	 <xsl:value-of select="concat('xsl/spl-stylesheet/core','/',$base-document-id,'/',.)"/>
      </xsl:attribute>
   </xsl:template>
   <xsl:template mode="mixin-base" match="/*|/*/v3:component">
      <xsl:apply-templates mode="mixin-base" select="@*|node()"/>
   </xsl:template>
   <xsl:template mode="mixin-base" match="v3:section[v3:id/@root and not(ancestor::v3:section)]">
      <xsl:variable name="new-section" select="$root//v3:section[(v3:replacementOf/v3:sectionReplaced/v3:id/@root = current()/v3:id/@root) or (not(ancestor::v3:section) and v3:code[@code = current()/v3:code/@code and @codeSystem = current()/v3:code/@codeSystem])]"/>
      <xsl:choose>
	 <xsl:when test="$new-section">
	    <xsl:apply-templates mode="mixin" select="$new-section"/>
	 </xsl:when>
	 <xsl:otherwise>
	    <xsl:copy>
	       <xsl:apply-templates mode="mixin-base" select="@*|node()"/>
	    </xsl:copy>
	 </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
</xsl:transform>
