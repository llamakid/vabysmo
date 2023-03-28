<?xml version="1.0" encoding="us-ascii"?>
<!--
The contents of this file are subject to the Health Level-7 Public
License Version 1.0 (the "License"); you may not use this file
except in compliance with the License. You may obtain a copy of the
License at http://www.hl7.org/HPL/hpl.txt.

Software distributed under the License is distributed on an "AS IS"
basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
the License for the specific language governing rights and
limitations under the License.

The Original Code is all this file.

The Initial Developer of the Original Code is Gunther Schadow.
Portions created by Initial Developer are Copyright (C) 2002-2004
Health Level Seven, Inc. All Rights Reserved.

Contributor(s): Steven Gitterman, Brian Keller, Brian Suggs

Revision: $Id: spl-common.xsl,v 1.5 2005/10/07 17:14:07 gschadow Exp $

Revision: $Id: spl-common.xsl,v 1.5 2006/02/15 16:50:07 sbsuggs Exp $

Revision: $Id: spl-common.xsl,v 2.0 2006/08/24 04:11:00 sbsuggs Exp $

TODO: footnote styleCode Footnote, Endnote not yet obeyed
TODO: Implementation guide needs to define linkHtml styleCodes.
-->
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:v3="urn:hl7-org:v3" xmlns:v="http://validator.pragmaticdata.com/result" xmlns:str="http://exslt.org/strings" xmlns:exsl="http://exslt.org/common" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" exclude-result-prefixes="exsl msxsl v3 xsl xsi">
	<xsl:import href="xml-verbatim.xsl"/>
	<xsl:import href="mixin.xsl"/>
	<xsl:param name="show-subjects-xml" select="1"/>
	<xsl:param name="show-data" select="/.."/>
	<xsl:param name="show-section-numbers" select="/.."/>
	<xsl:param name="update-check-url-base" select="/.."/>
	<xsl:param name="standardSections" select="document('plr-sections.xml')/*"/>
	<xsl:param name="itemCodeSystems" select="document('item-code-systems.xml')/*"/>
	<xsl:param name="disclaimers" select="document('disclaimers.xml')/*"/>
	<xsl:param name="documentTypes" select="document('doc-types.xml')/*"/>
	<xsl:param name="root" select="/"/>
	<xsl:param name="css" select="'./spl.css'"/>
	<xsl:param name="process-mixins" select="/.."/>
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="no" doctype-public="-"/>
	<xsl:strip-space elements="*"/>
	<!-- The indication secction variable contains the actual Indication Section node-->
	<xsl:variable name="indicationSection" select="/v3:document/v3:component/v3:structuredBody/v3:component//v3:section [v3:code [descendant-or-self::* [(self::v3:code or self::v3:translation) and @codeSystem='2.16.840.1.113883.6.1' and @code='34067-9'] ] ]"/>
	<xsl:variable name="indicationSectionCode">34067-9</xsl:variable>
	<xsl:variable name="dosageAndAdministrationSectionCode">34068-7</xsl:variable>

	<!-- Process mixins if they exist -->
	<xsl:template match="/" priority="1">
		<xsl:choose>
			<xsl:when test="boolean($process-mixins) and *[v3:relatedDocument[@typeCode='APND' and v3:relatedDocument[v3:id/@root or v3:setId/@root]]]">
				<xsl:variable name="mixinRtf">
					<xsl:apply-templates mode="mixin" select="."/>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="function-available('exsl:node-set')">
						<xsl:apply-templates select="exsl:node-set($mixinRtf)/*"/>
					</xsl:when>
					<xsl:when test="function-available('msxsl:node-set')">
						<xsl:apply-templates select="msxsl:node-set($mixinRtf)/*"/>
					</xsl:when>
					<xsl:otherwise>
						<!-- XSLT 2 would be thus: xsl:apply-templates select="$mixinRtf/*"/ -->
						<xsl:message terminate="yes">required function node-set is not available, this XSLT processor cannot handle the transform</xsl:message>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="*"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- MAIN MODE based on the deep null-transform -->
	<xsl:template match="/|@*|node()">
		<xsl:apply-templates select="@*|node()"/>
	</xsl:template>
	<xsl:template match="/v3:document/v3:title" priority="1"/>
	<xsl:template match="/v3:document">
		<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
				<meta name="documentId" content="{/v3:document/v3:id/@root}"/>
				<meta name="documentSetId" content="{/v3:document/v3:setId/@root}"/>
				<meta name="documentVersionNumber" content="{/v3:document/v3:versionNumber/@value}"/>
				<meta name="documentEffectiveTime" content="{/v3:document/v3:effectiveTime/@value}"/>
				<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>
				<meta name="apple-mobile-web-app-capable" content="yes"/>
				<title>
					<xsl:value-of select="v3:title"/>
				</title>
				<link rel="stylesheet" type="text/css" href="{$css}"/>
				<link rel="stylesheet" type="text/css" href="../assets/css/styles.css" />
				<link rel="stylesheet" type="text/css" href="../assets/css/product.css" />
				<link rel="stylesheet" type="text/css" href="product.css" />
				<script src="../assets/js/jquery.min.js"/>
				<script type="text/javascript" src="../assets/js/jquery.kinetic.js"/>
				<script type="text/javascript" src="../assets/js/ipi.js"/>
				<xsl:call-template name="include-custom-items"/>
				<xsl:if test="boolean($show-subjects-xml)">
					<xsl:call-template name="xml-verbatim-setup"/>
				</xsl:if>
				<style>
					/*<![CDATA[*/
					#pi-content #scrollable {
						overflow: scroll;
						-webkit-overflow-scrolling:touch;
						left: 0px;
					}
					
					#nav #scrollable {
						overflow: scroll;
						-webkit-overflow-scrolling:touch;
					}
					
					body {padding:0; margin:0;}
					.ipad {width:1024px; height:768px; background-image:url(heme_bkg.jpg);}
					.backBtn {margin-top:-2px;}
					.searchMin {margin-top:-2px;}
					nav {float:left; width:300px; height:700px; overflow:hidden;}
					nav div {width:295px; height:680px; overflow:scroll;}
					nav div ul {width:255px;}
					
					div.c9 {font-size: 11px; text-align: center}
					div.c8 {float: left; height: 700px; overflow: hidden; width: 724px}
					col.c7 {text-align: left}
					col.c6 {text-align: center}
					li.c3 {border-top-right-radius: 10px !important; border-bottom-right-radius: 10px !important; cursor:hand}
					a.c2 {display:none}
					
					footer {margin-top:40px; clear:both; float:left; width:100%}
					footer div {font-size:11px text-align: center}
					/*]]>*/
				</style>
			</head>
			<body class="spl" id="spl" onload="window.focus();">
			    <!--xsl:attribute name="onload"><xsl:text>if(typeof convertToTwoColumns == "function")convertToTwoColumns();</xsl:text></xsl:attribute-->
				<!--xsl:apply-templates mode="title" select="."/-->

				<div class="ipad">
					<!-- ############## Header/ Search Component ############## -->
					<div class="backBtn">
						<div id="backButton" onclick="backToTop();"><img src="../assets/images/bck_top.png"/></div>
					</div>
					
				<!--REMOVED from central template - Alanys -->
					<!--<div class="title">
						<div><img src="../avastin/heme_title.png"/></div>
					</div>-->
					
					<header id="searchForm" class="searchMin">
						<input type="text" id="searchBox" autocapitalize="off" autocorrect="off" autocomplete="off" value="Search" onfocus="sFocus(this)"/>
						<span id="searchParams">
							<span id="count"></span>
							<div id="searchBtn" class="searchBtnHeme" onClick="runSearch();">
								<img src="../assets/images/heme_search-btn.png"/>
							</div>
							<a id="next" style="display:none" class="newNext">
								<img src="../assets/images/next.png" height="42" width="42"/>
							</a>
						</span>
					</header>
				<div class="clear"></div>
				<xsl:choose>
					<xsl:when test="//v3:excerpt/v3:highlight">
						<!-- Generate the Table of Contents only if the SPL is PLR. -->
						<xsl:variable name="indexRtf">
							<xsl:apply-templates mode="index" select="."/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="function-available('exsl:node-set')">
								<xsl:apply-templates mode="twocolumn" select="exsl:node-set($indexRtf)">
									<xsl:with-param name="class">Index</xsl:with-param>
								</xsl:apply-templates>
							</xsl:when>
							<xsl:when test="function-available('msxsl:node-set')">
								<xsl:apply-templates mode="twocolumn" select="msxsl:node-set($indexRtf)">
									<xsl:with-param name="class">Index</xsl:with-param>
								</xsl:apply-templates>
							</xsl:when>
							<xsl:otherwise>
								<xsl:message terminate="yes">required function node-set is not available, this XSLT processor cannot handle the transform</xsl:message>
							</xsl:otherwise>
						</xsl:choose>
						
						<!--
						<xsl:variable name="highlightsRtf">
							<xsl:apply-templates mode="highlights" select="."/>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="function-available('exsl:node-set')">
								<xsl:apply-templates mode="twocolumn" select="exsl:node-set($highlightsRtf)">
									<xsl:with-param name="class">Highlights</xsl:with-param>
								</xsl:apply-templates>	
							</xsl:when>
							<xsl:when test="function-available('msxsl:node-set')">
								<xsl:apply-templates mode="twocolumn" select="msxsl:node-set($highlightsRtf)">
									<xsl:with-param name="class">Highlights</xsl:with-param>
								</xsl:apply-templates>	
							</xsl:when>
							<xsl:otherwise>
								<xsl:message terminate="yes">required function node-set is not available, this XSLT processor cannot handle the transform</xsl:message>
							</xsl:otherwise>
						</xsl:choose>
						-->
					</xsl:when>
					<xsl:otherwise>
						<h1><xsl:apply-templates mode="mixed" select="v3:title"/></h1>
					</xsl:otherwise>
				</xsl:choose>

				<div id="pi-content" class="Contents" style="float:left; width:724px; height:700px; overflow:hidden;">
					<div style="float:left; width:724px; height:700px; overflow:scroll">
						<xsl:if test="//v3:excerpt/v3:highlight">
							<!--Removed from template on 9.17.13 -->
							<h1>FULL PRESCRIBING INFORMATION</h1>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="//v3:excerpt/v3:highlight">
								<xsl:variable name="highlightsRtf">
									<xsl:apply-templates mode="highlights" select="."/>
								</xsl:variable>
								<xsl:choose>
									<xsl:when test="function-available('exsl:node-set')">
										<xsl:apply-templates mode="twocolumn" select="exsl:node-set($highlightsRtf)">
											<xsl:with-param name="class">Highlights</xsl:with-param>
										</xsl:apply-templates>	
									</xsl:when>
									<xsl:when test="function-available('msxsl:node-set')">
										<xsl:apply-templates mode="twocolumn" select="msxsl:node-set($highlightsRtf)">
											<xsl:with-param name="class">Highlights</xsl:with-param>
										</xsl:apply-templates>	
									</xsl:when>
									<xsl:otherwise>
										<xsl:message terminate="yes">required function node-set is not available, this XSLT processor cannot handle the transform</xsl:message>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:otherwise>
								<h1><xsl:apply-templates mode="mixed" select="v3:title"/></h1>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:apply-templates select="@*|node()"/>
					</div>
				</div>
				
				<xsl:if test="boolean($show-data)">
					<div class="DataElementsTables">
						<xsl:call-template name="PLRIndications"/>
						<xsl:call-template name="PLRInteractions"/>
						<xsl:if test="//v3:*[self::v3:ingredientSubstance[starts-with(../@classCode,'ACTI')] or self::v3:identifiedSubstance]">
							<xsl:call-template name="PharmacologicalClass"/>
						</xsl:if>
						<xsl:apply-templates mode="subjects" select="//v3:section/v3:subject/v3:manufacturedProduct"/>
						<xsl:apply-templates mode="subjects" select="v3:author/v3:assignedEntity/v3:representedOrganization"/>
						<xsl:apply-templates mode="subjects" select="v3:author/v3:assignedEntity/v3:representedOrganization/v3:assignedEntity/v3:assignedOrganization"/>
						<xsl:apply-templates mode="subjects" select="v3:author/v3:assignedEntity/v3:representedOrganization/v3:assignedEntity/v3:assignedOrganization/v3:assignedEntity/v3:assignedOrganization"/>
					</div>
				</xsl:if>
				
				<p>
					<xsl:call-template name="effectiveDate"/>
					<xsl:text>&#160;</xsl:text>
					<!--<xsl:call-template name="distributorName"/>-->
				</p>
				<xsl:if test="boolean($show-subjects-xml)">
					<hr/>
					<div class="Subject" onclick="xmlVerbatimClick(event);" ondblclick="xmlVerbatimDblClick(event);">
						<xsl:apply-templates mode="xml-verbatim" select="node()"/>
					</div>
				</xsl:if>
				<div class="clear"></div>
				<!--<footer>
					<div>
						<center>
							&#169; 2012 Genentech USA, Inc., and Biogen Idec Inc. All rights reserved. PI Revision Date 10/2012
						</center>
					</div>
				</footer>-->
					<script type="text/javascript" src="../assets/js/jScrollTouch.js"/>
					<script type="application/javascript" src="../assets/js/search.js"/>
					<script type="text/javascript" src="../assets/js/jquery.scrollTo-1.4.2-min.js"/>
					<script type="text/javascript" src="../assets/js/omniture.js"/>
				</div>
			</body>
		</html>
	</xsl:template>
	<!-- helper templates -->
	<xsl:template priority="2" match="v3:highlight//@width[not(contains(.,'%'))]" /> <!-- This would avoid things moving out of 2-column view -->
	<xsl:template mode="twocolumn" match="/|node()|@*">
		<xsl:param name="class"/>
		<xsl:copy>
			<xsl:apply-templates mode="twocolumn" select="@*|node()">
				<xsl:with-param name="class" select="$class"/>
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>
	<xsl:template name="include-custom-items">
		<script src="{$resourcesdir}spl.js" type="text/javascript" charset="utf-8">/* */</script>
    </xsl:template>

	<xsl:template name="string-lowercase">
		<!--** Convert the input text that is passed in as a parameter to lower case  -->
		<xsl:param name="text"/>
		<xsl:value-of select="translate($text,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
	</xsl:template>
	<xsl:template name="string-uppercase">
		<!--** Convert the input text that is passed in as a parameter to upper case  -->
		<xsl:param name="text"/>
		<xsl:value-of select="translate($text,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
	</xsl:template>
	<xsl:template name="printSeperator">
		<!--** Print an ampercent-->
		<xsl:param name="currentPos" select="position()"/>
		<xsl:param name="lastPos" select="last()"/>
		<xsl:param name="lastDelimiter">and</xsl:param>
		<xsl:choose>
			<xsl:when test="number($currentPos) = number($lastPos)-1"><xsl:value-of select="$lastDelimiter"/>&#160;</xsl:when>
			<xsl:when test="number($currentPos) &lt; number($lastPos)-1">,&#160;</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="string-to-date">
		<xsl:param name="text"/>
		<xsl:param name="displayMonth">true</xsl:param>
		<xsl:param name="displayDay">true</xsl:param>
		<xsl:param name="displayYear">true</xsl:param>
		<xsl:param name="delimiter">/</xsl:param>
		<xsl:if test="string-length($text) > 7">
			<xsl:variable name="year" select="substring($text,1,4)"/>
			<xsl:variable name="month" select="substring($text,5,2)"/>
			<xsl:variable name="day" select="substring($text,7,2)"/>
			<!-- changed by Brian Suggs 11-13-05.  Changes made to display date in MM/DD/YYYY format instead of DD/MM/YYYY format -->
			<xsl:if test="$displayMonth = 'true'">
				<xsl:value-of select="$month"/>
				<xsl:value-of select="$delimiter"/>
			</xsl:if>
			<xsl:if test="$displayDay = 'true'">
				<xsl:value-of select="$day"/>
				<xsl:value-of select="$delimiter"/>
			</xsl:if>
			<xsl:if test="$displayYear = 'true'">
				<xsl:value-of select="$year"/>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="format" match="*/v3:addr">
		<table>
			<tr><td>Address:</td><td><xsl:value-of select="./v3:streetAddressLine"/></td></tr>
			<tr><td>City, State, Zip:</td>
			<td>
				<xsl:value-of select="./v3:city"/>
				<xsl:if test="string-length(./v3:state)>0">,&#160;<xsl:value-of select="./v3:state"/></xsl:if>
				<xsl:if test="string-length(./v3:postalCode)>0">,&#160;<xsl:value-of select="./v3:postalCode"/></xsl:if>
			</td>
			</tr>
			<tr><td>Country:</td><td><xsl:value-of select="./v3:country"/></td></tr>
		</table>
	</xsl:template>

	<!-- MODE HIGHLIGHTS -->
	<!-- Requirements: there used to be a lot of content created from data, now that is less and more is just written.
			 certain rearrangements are still made. sequence:
			 - frontmatter (material that is before any section)
			 - highlights title: "HIGHLIGHTS OF PRESCRIBING INFORMATION" -> generated title
			 - highlights limitation statement: "these highlights do not ..." -> from document title (FIXME)
			 - highlights drug title: "Cifidipan for immersion in bathtub" -> from document title
			 - initial US approval year: "Initial U.S. Approval: 2099" -> from document title
			 - recent major changes -> pulled up from recent major changes section
			 - microbiology advisory "To reduce ... drug-resistant ..." -> microbiology highlight pulled up
			 - what gets pulled up into the frontmatter is determined by $standardSection/*[@highlightfrontmatter]
			 - boxed warning section (no title shown, and the box)
			 - all others (except frontmatter pull-up)
			 - backmatter
			 - BPCA pediatric advisory like microbiology but pulled last at the end of the highlights (after the revision date.)
			 - patient counseling information reference 34076-0 text based on what other sections are ther
			 * 38056-8 supplemental patient material
			 * 42231-1 medguide
			 * 42230-3 patient package insert
			 [reverse engineered requirements
			 - -42231-1 -38056-8 -42230-3 => See 17 for PATIENT COUNSELING INFORMATION
			 - -42231-1 +38056-8|+42230-3 => See 17 for PCI and FDA-approved patient labeling
			 - +42231-1 -38056-8|-42230-3 => See 17 for PCI and Medication Guide
			 - +42231-1 +38056-8 +42230-3 => See 17 for PCI and Medication Guide]
			 if 42231-1 is subsection of 34076-0 add "and Medication Guide"
			 if 42231-1 is not there but patient package insert add "and FDA-approved patient labeling"
			 just make reference to any of these 3 sub-sections - any $standardSection/*[@patsec]
			 it should not labeled as section "17" if it isn't 17 
	-->
	<xsl:template mode="highlights" match="/|@*|node()">
		<xsl:apply-templates mode="highlights" select="@*|node()"/>
	</xsl:template>
	<xsl:template mode="highlights" match="/v3:document">
		<div id="Highlights" name="Highlights" class="Highlights">
		<table cellspacing="5" cellpadding="20" width="100%" style="table-layout:fixed">
			<tr>
				<!--td width="50%" align="left" valign="top">
					<div/>
				</td-->
				<td width="50%" align="left" valign="top">
					<div>
						<h1>HIGHLIGHTS OF PRESCRIBING INFORMATION</h1>
						<xsl:apply-templates mode="highlights" select="@*|node()" />
					</div>
				</td>
			</tr>
		</table>
		</div>
	</xsl:template>
	<xsl:template mode="highlights" match="/v3:document/v3:title">
		<div class="HighlightsDisclaimer">
			<xsl:apply-templates mode="mixed" select="."/>
		</div>
	</xsl:template>
	<xsl:template mode="highlights" match="v3:structuredBody">
		<!-- here is where we undertake some hard re-ordering -->
		<xsl:variable name="body" select="."/>
		<xsl:variable name="pullUpSections" select="$standardSections//v3:section[@highlightfrontmatter]"/>
		<xsl:variable name="pullDownSections" select="$standardSections//v3:section[@highlightbackmatter]"/>
		<xsl:for-each select="$pullUpSections">
			<xsl:sort select="@highlightfrontmatter"/>
			<xsl:apply-templates mode="highlights" select="$body//v3:section[v3:excerpt][not(ancestor::v3:section[v3:excerpt])][v3:code/@code = current()/@code]">
				<xsl:with-param name="suppressTitle" select="@suppressTitle"/>
				<xsl:with-param name="doNotSuppressFrontOrBackMatter" select="1"/>
			</xsl:apply-templates>
		</xsl:for-each>
		 <xsl:apply-templates mode="highlights" select="$body/*"/>
		<xsl:call-template name="patientLabelReference"/>
		<xsl:call-template name="effectiveDateHighlights"/>
		<xsl:for-each select="$pullDownSections">
			<xsl:sort select="@highlightbackmatter"/>
			<xsl:apply-templates mode="highlights" select="$body//v3:section[v3:excerpt][v3:code/@code = current()/@code]">
				<xsl:with-param name="suppressTitle" select="@suppressTitle"/>
				<xsl:with-param name="doNotSuppressFrontOrBackMatter" select="1"/>
			</xsl:apply-templates>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="patientLabelReference">
		<xsl:variable name="std-patsecs" select="$standardSections//v3:section[@patsec]"/>
		<xsl:variable name="patsecs" select=".//v3:section[v3:code[@code = $std-patsecs/@code]]"/>
		<xsl:if test="$patsecs">
			<p class="HighlightsSeeReference">
				<xsl:text>See </xsl:text>
				<!-- XXX: this hard reference to section 17 is not always right, 
						 but we got pushback on our attempt to use the actual reference, 
						 hence I am moving it back to hard coded "17" for now. -->
				<xsl:text>17</xsl:text>
				<!-- xsl:for-each select="$patsecs">
						 <xsl:variable name="sectionNumber">
						 <xsl:apply-templates mode="sectionNumber" select="."/>
						 </xsl:variable>
						 <xsl:choose>
						 <xsl:when test="position() = 2 and count($patsecs) = 2">
						 <xsl:text> and </xsl:text>
						 </xsl:when>
						 <xsl:when test="position() > 1 and position() = count($patsecs)">
						 <xsl:text>, and </xsl:text>
						 </xsl:when>
						 <xsl:when test="position() > 1">
						 <xsl:text>, </xsl:text>
						 </xsl:when>
						 </xsl:choose>
						 <a href="#section-{substring($sectionNumber,2)}">
						 <xsl:value-of select="substring($sectionNumber,2)"/>
						 </a>
						 </xsl:for-each -->
				<xsl:text> for </xsl:text>
				<xsl:for-each select="$patsecs">
					<xsl:if test="not($patsecs[generate-id(.) = generate-id(current()/../..)])">
						<!-- preventing sub-sections in a patient section to be mentioned -->
						<xsl:choose>
							<xsl:when test="position() = 2 and count($patsecs) = 2">
								<xsl:text> and </xsl:text>
							</xsl:when>
							<xsl:when test="position() > 1 and position() = count($patsecs)">
								<xsl:text>, and </xsl:text>
							</xsl:when>
							<xsl:when test="position() > 1">
								<xsl:text>, </xsl:text>
							</xsl:when>
						</xsl:choose>
						<xsl:value-of select="$std-patsecs[@code = current()/v3:code/@code]/v3:title"/>
					</xsl:if>
				</xsl:for-each>
				<xsl:text>.</xsl:text>
			</p>
		</xsl:if>
	</xsl:template>
	<xsl:template name="effectiveDateHighlights">
		<xsl:if test="/v3:document/v3:effectiveTime[@value != '']">
			<p class="HighlightsRevision">
				<xsl:text>Revised: </xsl:text>
				<xsl:apply-templates mode="data" select="/v3:document/v3:effectiveTime">
					<xsl:with-param name="displayMonth">true</xsl:with-param>
					<xsl:with-param name="displayDay">false</xsl:with-param>
					<xsl:with-param name="displayYear">true</xsl:with-param>
					<xsl:with-param name="delimiter">/</xsl:with-param>
				</xsl:apply-templates>
				<xsl:if test="$update-check-url-base">
					<xsl:variable name="url" select="concat($update-check-url-base, v3:document/v3:setId/@root)"/>
					<xsl:text> </xsl:text>
					<a href="{$url}">
						<xsl:text>Click here to check for updated version.</xsl:text>
					</a>
				</xsl:if>
			</p>
		</xsl:if>
	</xsl:template>

	<xsl:template mode="highlights" match="v3:section">
		<xsl:param name="suppressTitle" select="/.."/>
		<xsl:param name="doNotSuppressFrontOrBackMatter" select="/.."/>
		 
		 <xsl:if test="$doNotSuppressFrontOrBackMatter or not($standardSections//v3:section[@code = current()/v3:code/@code][@highlightfrontmatter or @highlightbackmatter])">
			<div>
				<xsl:if test="v3:excerpt and not($suppressTitle)">
					<xsl:attribute name="class">Highlight<xsl:if test="ancestor::v3:section[v3:excerpt]">Sub</xsl:if>Section</xsl:attribute>
				</xsl:if>
				<xsl:apply-templates mode="highlights" select="@*|v3:excerpt">
					<xsl:with-param name="suppressTitle" select="$suppressTitle"/>
				</xsl:apply-templates>
				<xsl:apply-templates mode="highlights" select="node()[not(self::v3:excerpt)]">
					<xsl:with-param name="suppressTitle" select="$suppressTitle"/>
				</xsl:apply-templates>
			</div>
		 </xsl:if>
	</xsl:template>
	<xsl:template mode="highlights" match="v3:section[v3:code[@codeSystem='2.16.840.1.113883.6.1' and @code='34066-1']][v3:excerpt]">	<!-- BOXED WARNING -->
	  <xsl:param name="doNotSuppressFrontOrBackMatter" select="/.."/>
	  <xsl:if test="$doNotSuppressFrontOrBackMatter">
	   <div class="Warning">
		<xsl:apply-templates mode="highlights" select="@*|v3:excerpt">
		 <xsl:with-param name="suppressTitle" select="1"/>
		</xsl:apply-templates>
		<xsl:apply-templates mode="highlights" select="node()[not(self::v3:excerpt)]">
		 <xsl:with-param name="suppressTitle" select="1"/>
		</xsl:apply-templates>
	   </div>
	  </xsl:if>
	</xsl:template>

	<xsl:template mode="highlights" match="v3:excerpt">
		<xsl:param name="suppressTitle" select="/.."/>
		<xsl:variable name="currentCode" select="parent::v3:section/v3:code/@code"/>
		<xsl:variable name="standardSection" select="$standardSections//v3:section[@code=$currentCode]"/>
		<xsl:variable name="sectionNumber" select="$standardSection/@number"/>
		<xsl:variable name="currentSectionNum">
			<xsl:apply-templates mode="sectionNumber" select="ancestor-or-self::v3:section"/>
		</xsl:variable>
		<xsl:if test="not($suppressTitle)">
			<h1 class="Highlights">
				<span>
					<xsl:variable name="standardTitle" select="$standardSection[1]/v3:title"/>
					<xsl:choose>
						<xsl:when test="$standardTitle">
							<xsl:value-of select="translate($standardTitle,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')" />
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="translate(v3:code/@displayName,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
						</xsl:otherwise>
					</xsl:choose>
				</span>
			</h1>
		</xsl:if>
		<div>
			<xsl:apply-templates mode="mixed" select="@*|node()[not(self::v3:title)]"/>
		</div>
	</xsl:template>

	<xsl:template mode="mixed" match="v3:section[v3:code[@codeSystem='2.16.840.1.113883.6.1' and @code='34066-1']]/v3:excerpt/v3:highlight//v3:paragraph[position() &lt; 3]" priority="1">
		<h1 class="Warning">
			<xsl:apply-templates mode="mixed" select="node()[not(self::v3:caption)]"/>
		</h1>
	</xsl:template>

	<xsl:template name="highlightsAutoLink">
		<xsl:if test="ancestor::v3:text[1][not(descendant::v3:linkHtml)][not(v3:paragraph[substring(normalize-space(text()), string-length(normalize-space(text()))-1) = ')'])] and not(ancestor::v3:section[v3:code/@code = $unnumberedSectionCodes])">
      <xsl:variable name="reference" select="ancestor::v3:highlight[1]/v3:reference"/>
			<xsl:apply-templates mode="reference" select=".|//v3:section[v3:id/@root=$reference/v3:section/v3:id/@root and not(ancestor::v3:reference)]"/>
		</xsl:if>
	</xsl:template>

	<xsl:template mode="mixed" match="v3:highlight//v3:paragraph">
		<p class="Highlights{@styleCode}">
			<xsl:apply-templates select="v3:caption"/>
			<xsl:apply-templates mode="mixed" select="node()[not(self::v3:caption)]"/>
			<xsl:text> </xsl:text>
			<xsl:call-template name="highlightsAutoLink"/>
		</p>
	</xsl:template>
	<xsl:template mode="mixed" match="v3:highlight//v3:paragraph[@styleCode='Bullet']" priority="2">
		<p class="HighlightsHanging">
			<span class="Exdent">&#x2022;</span>
			<xsl:apply-templates select="v3:caption"/>
			<xsl:apply-templates mode="mixed" select="node()[not(self::v3:caption)]"/>
			<xsl:text> </xsl:text>
			<xsl:call-template name="highlightsAutoLink"/>
		</p>
	</xsl:template>

	<!-- MODE index -->
	<xsl:template mode="index" match="/|@*|node()">
		<xsl:apply-templates mode="index" select="@*|node()"/>
	</xsl:template>
	<xsl:template mode="index" match="v3:document" priority="0">
		<div id="Index" class="Index">
			<nav id="nav" role="navigation">
				<div id="scrollable">
					<ul class="top">
						<a href="#Highlights" class="toc">
							<h1>HIGHLIGHTS</h1>
						</a>
					<xsl:apply-templates mode="index" select="@*|node()" />
					</ul>
				</div>
			</nav>
		<!--
		<table cellspacing="5" cellpadding="5" width="100%" style="table-layout:fixed">
			<tr>
				<td width="50%" align="left" valign="top">
					<div/>
				</td>
				<td width="50%" align="left" valign="top">
					<div>
						<h1>
							<a href="#Highlights" class="toc">HIGHLIGHTS</a>
						</h1>
						<xsl:apply-templates mode="index" select="@*|node()" />
						<dl class="Footnote">
							<dt>
								<a href="#footnote-reference-content" name="footnote-content">*</a>
							</dt>
							<dd>Sections or subsections omitted from the full prescribing information are not listed.</dd>
						</dl>
					</div>
				</td>
			</tr>
		</table>
		-->
		</div>
	</xsl:template>
	<xsl:template mode="index" match="v3:section/v3:component/v3:section/v3:component/v3:section" priority="1">
		<!-- per FDA PCR 575: only include sections and first level of subsections in the contents -->
	</xsl:template>
	<xsl:template mode="index" match="v3:section[v3:title and descendant::v3:text[parent::v3:section]]" priority="0">
		<xsl:param name="sectionLevel" select="count(ancestor::v3:section)+1"/>
		<xsl:param name="sectionNumber" select="/.."/>
		<xsl:param name="standardSection" select="$standardSections//v3:section[@code=current()/v3:code/descendant-or-self::*[(self::v3:code or self::v3:translation) and @codeSystem='2.16.840.1.113883.6.1']/@code]"/>
		<xsl:variable name="sectionNumberSequence">
			<xsl:apply-templates mode="sectionNumber" select="ancestor-or-self::v3:section"/>
		</xsl:variable>
		<!--xsl:element name="h{$sectionLevel}" -->
			<xsl:choose>
				<xsl:when test="./v3:code[@codeSystem='2.16.840.1.113883.6.1' and @code='34066-1']">  <!-- BOXED WARNING -->
					<!--a href="#section-{substring($sectionNumberSequence,2)}"-->
					<a>
					<xsl:attribute name="href"><xsl:text>#</xsl:text><xsl:value-of select="@ID"/></xsl:attribute>
					<xsl:attribute name="class">toc</xsl:attribute>
					
					<xsl:element name="h{$sectionLevel}">
						<xsl:apply-templates select="@*"/>
						<!-- PCR 601 Not displaying foonote mark inside a table of content -->
						<xsl:text>BOXED WARNINGS</xsl:text>
					</xsl:element>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<a href="#section-{substring($sectionNumberSequence,2)}">
						<!--<xsl:attribute name="class">toc</xsl:attribute>-->
						<xsl:attribute name="href"><xsl:text></xsl:text><xsl:value-of select= "concat('#s','ection-',translate(@ID, '#s',''))"/></xsl:attribute>
						
						<xsl:element name="h{$sectionLevel}">
							<xsl:apply-templates select="@*"/>
							<!-- PCR 601 Not displaying foonote mark inside a table of content -->
							<xsl:apply-templates mode="mixed" select="./v3:title/node()">
							<xsl:with-param name="isTableOfContent" select="'yes'"/>
							</xsl:apply-templates>
						</xsl:element>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		<!-- /xsl:element -->
		<xsl:apply-templates mode="index" select="@*|node()"/>
	</xsl:template>

	<!-- MODE: reference -->
	<!-- Create a section number reference such as (13.2) -->
	<xsl:template mode="reference" match="/|@*|node()">
		<xsl:text> (</xsl:text>
		<xsl:variable name="sectionNumberSequence">
			<xsl:apply-templates mode="sectionNumber" select="ancestor-or-self::v3:section"/>
		</xsl:variable>
		<a href="#section-{substring($sectionNumberSequence,2)}">
			<xsl:value-of select="substring($sectionNumberSequence,2)"/>
		</a>
		<xsl:text>)</xsl:text>
	</xsl:template>

	<!-- styleCode processing: styleCode can be a list of tokens that
			 are being combined into a single css class attribute. To 
			 come to a normalized combination we sort the tokens. 

Step 1: combine the attribute supplied codes and additional
codes in a single token list.

Step 2: split the token list into XML elements

Step 3: sort the elements and turn into a single combo
token.
	-->
	<xsl:template match="@styleCode" name="styleCodeAttr">
		<xsl:param name="styleCode" select="."/>
		<xsl:param name="additionalStyleCode" select="/.."/>
		<xsl:param name="allCodes" select="normalize-space(concat($additionalStyleCode,' ',$styleCode))"/>
		<xsl:param name="additionalStyleCodeSequence" select="/.."/>
		<xsl:variable name="splitRtf">
			<xsl:if test="$allCodes">
				<xsl:call-template name="splitTokens">
					<xsl:with-param name="text" select="$allCodes"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:for-each select="$additionalStyleCodeSequence">
				<token value="{concat(translate(substring(current(),1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(current(),2))}"/>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="class">
			<xsl:choose>
				<xsl:when test="function-available('exsl:node-set')">
					<xsl:variable name="sortedTokensRtf">
						<xsl:for-each select="exsl:node-set($splitRtf)/token">
							<xsl:sort select="@value"/>
							<xsl:copy-of select="."/>
						</xsl:for-each>
					</xsl:variable>
					<xsl:call-template name="uniqueStyleCodes">
						<xsl:with-param name="in" select="exsl:node-set($sortedTokensRtf)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="function-available('msxsl:node-set')">
					<xsl:variable name="sortedTokensRtf">
						<xsl:for-each select="msxsl:node-set($splitRtf)/token">
							<xsl:sort select="@value"/>
							<xsl:copy-of select="."/>
						</xsl:for-each>
					</xsl:variable>
					<xsl:call-template name="uniqueStyleCodes">
						<xsl:with-param name="in" select="msxsl:node-set($sortedTokensRtf)"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<!-- this one below should work for all parsers as it is using exslt but will keep the above code for msxsl for now -->
					<xsl:message>WARNING: missing required function node-set, this xslt processor may not work correctly</xsl:message>
					<xsl:for-each select="str:tokenize($allCodes, ' ')">
						<xsl:sort select="."/>
						<xsl:copy-of select="."/>
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:choose>
			<xsl:when test="string-length($class) > 0">
				<xsl:attribute name="class">
					<xsl:value-of select="normalize-space($class)"/>
				</xsl:attribute>
			</xsl:when>
			<xsl:when test="string-length($allCodes) > 0">
				<xsl:attribute name="class">
					<xsl:value-of select="normalize-space($allCodes)"/>
				</xsl:attribute>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="additionalStyleAttr">
		<xsl:if test=".//v3:content[@styleCode[contains(.,'xmChange')]]">
			<xsl:attribute name="style">border-left:1px solid;</xsl:attribute>
		</xsl:if>
    </xsl:template>
	<xsl:template name="uniqueStyleCodes">
		<xsl:param name="in" select="/.."/>
		<xsl:for-each select="$in/token[not(preceding::token/@value = @value)]">
			<xsl:value-of select="@value"/><xsl:text> </xsl:text>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="splitTokens">
		<xsl:param name="text" select="."/>
		<xsl:param name="firstCode" select="substring-before($text,' ')"/>
		<xsl:param name="restOfCodes" select="substring-after($text,' ')"/>
		<xsl:choose>
			<xsl:when test="$firstCode">
				<token
						value="{concat(translate(substring($firstCode,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring($firstCode,2))}"/>
				<xsl:if test="string-length($restOfCodes) > 0">
					<xsl:call-template name="splitTokens">
						<xsl:with-param name="text" select="$restOfCodes"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<token value="{concat(translate(substring($text,1,1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring($text,2))}"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- DOCUMENT MODEL -->

	<xsl:template mode="title" match="/|@*|node()"/>
	<xsl:template mode="title" match="v3:document">
		<div class="DocumentTitle">
			<p class="DocumentTitle">
				<xsl:apply-templates select="./title/@*"/>
				<!-- loop through all of the subject elements -->			
				<xsl:for-each select=".//v3:subject[v3:manufacturedProduct[v3:manufacturedProduct|v3:manufacturedMedicine]]">
					<xsl:variable name="prevProductHeaderString">
						<xsl:for-each select="preceding::v3:manufacturedProduct/*[self::v3:manufacturedProduct or self::v3:manufacturedMedicine]">
							<xsl:call-template name="headerString">
								<xsl:with-param name="curProduct" select="." />
							</xsl:call-template>
						</xsl:for-each>
					</xsl:variable>
					<xsl:variable name="curProductHeaderString"><xsl:call-template name="headerString"><xsl:with-param name="curProduct" select="v3:manufacturedProduct/*[self::v3:manufacturedProduct or self::v3:manufacturedMedicine]" /></xsl:call-template></xsl:variable>
					<xsl:choose>
						<xsl:when test="position() > 1 and contains($prevProductHeaderString, $curProductHeaderString)">
							
						</xsl:when>
						<!-- otherwise display all the information for this subject -->
						<xsl:otherwise>
							<xsl:if test="position() > 1">
								<br/>
							</xsl:if>
							<xsl:for-each select="v3:manufacturedProduct/*[self::v3:manufacturedProduct or self::v3:manufacturedMedicine]">
								<strong>
									<xsl:call-template name="regMedNames"/>
									
								</strong>
							</xsl:for-each>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:for-each>	 
				<!--xsl:for-each select="(v3:author/v3:assignedEntity/v3:representedOrganization/v3:name)[1]">
					<br/>
					<xsl:value-of select="."/>
				</xsl:for-each-->
				<!--br/-->
			</p>
			<xsl:call-template name="flushDocumentTitleFootnotes"/>		
			<xsl:variable name="marketingCategories" select="//v3:manufacturedProduct/v3:subjectOf/v3:approval/v3:code"/>
			<xsl:for-each select="$disclaimers/document[code/@code = $root/v3:document/v3:code/@code]/disclaimer[code/@code = $marketingCategories/@code]/text">
				<p class="disclaimer">Disclaimer: <xsl:copy-of select="node()"/></p>
			</xsl:for-each>
			<xsl:if test="not(//v3:manufacturedProduct) and /v3:document/v3:code/@displayName">
			        <xsl:value-of select="/v3:document/v3:code/@displayName"/>
				<br/>
			</xsl:if>

		</div>
	</xsl:template>

	<xsl:template name="headerString">
		<xsl:param name="curProduct">.</xsl:param>
		<xsl:value-of select="$curProduct/v3:name"/>
		<xsl:value-of select="$curProduct/v3:formCode/@code"/>
		<xsl:choose>
			<xsl:when test="$curProduct/v3:part">
				<xsl:value-of select="$curProduct/v3:asEntityWithGeneric/v3:genericMedicine/v3:name"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="$curProduct/*[self::v3:ingredient[starts-with(@classCode, 'ACTI')] or self::v3:activeIngredient]">
					<xsl:call-template name="string-lowercase">
						<xsl:with-param name="text" select="(v3:ingredientSubstance|v3:activeIngredientSubstance)/v3:name"/>
					</xsl:call-template> 
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>		
	</xsl:template>
	<xsl:template name="regMedNames">	
		<xsl:variable name="medName">
			<xsl:call-template name="string-lowercase">
				<xsl:with-param name="text">
					<xsl:copy><xsl:apply-templates mode="specialCus" select="./v3:name" /></xsl:copy>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:value-of select="$medName"/>
		<xsl:if test="./v3:name/v3:suffix">&#160;</xsl:if>
		<xsl:call-template name="string-lowercase">
			<xsl:with-param name="text"
											select="./v3:name/v3:suffix"/>
		</xsl:call-template> 
		<!--xsl:text>- </xsl:text-->
		<!--xsl:choose>
			<xsl:when test="v3:ingredient[starts-with(@classCode, 'ACTI')]|v3:activeIngredient">
				<xsl:for-each select="v3:ingredient[starts-with(@classCode, 'ACTI')]|v3:activeIngredient">
					<xsl:choose>
						<xsl:when test="position() > 1 and  position() = last()">
							<xsl:text> and </xsl:text>
						</xsl:when>
						<xsl:when test="position() > 1">
							<xsl:text>, </xsl:text>
						</xsl:when>
					</xsl:choose>
					<xsl:call-template name="string-lowercase">
						<xsl:with-param name="text" select="*[self::v3:ingredientSubstance or self::v3:activeIngredientSubstance]/v3:name"/>
					</xsl:call-template> 
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<xsl:variable name="genMedName">
					<xsl:call-template name="string-uppercase">
						<xsl:with-param name="text" select="./v3:asEntityWithGeneric/v3:genericMedicine/v3:name|v3:asSpecializedKind/v3:generalizedMaterialKind/v3:code[@codeSystem = '2.16.840.1.113883.6.276' or @codeSystem = '2.16.840.1.113883.6.303']/@displayName"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:choose>
					<xsl:when test="$medName != $genMedName">
						<xsl:call-template name="string-lowercase">
							<xsl:with-param name="text"
															select="$genMedName"
															/>
						</xsl:call-template> 
					</xsl:when>
					<xsl:otherwise>&#160;</xsl:otherwise>
					</xsl:choose>&#160;
			</xsl:otherwise>
			</xsl:choose>&#160;<xsl:if test="not(v3:part)">
			<xsl:call-template name="string-lowercase">
				<xsl:with-param name="text"
												select="./v3:formCode/@displayName"/>
			</xsl:call-template>
			<xsl:text>&#160;</xsl:text>
		</xsl:if-->
	</xsl:template>	
	<xsl:template mode="specialCus" match="v3:name">
		<xsl:value-of select="text()"/>
	</xsl:template>	

	<xsl:template name="titleNumerator">
		<xsl:for-each
				select="./v3:activeIngredient[(./v3:quantity/v3:numerator/@unit or ./v3:quantity/v3:denominator/@unit) and (./v3:quantity/v3:numerator/@unit != '' or ./v3:quantity/v3:denominator/@unit != '') and (./v3:quantity/v3:numerator/@unit != '1' or ./v3:quantity/v3:denominator/@unit != '1')]">
			<xsl:if test="position() = 1">&#160;</xsl:if>
			<xsl:if test="position() > 1">&#160;/&#160;</xsl:if>
			<xsl:value-of select="./v3:quantity/v3:numerator/@value"/>
			<xsl:if test="./v3:quantity/v3:numerator/@unit">&#160;<xsl:value-of select="./v3:quantity/v3:numerator/@unit"/></xsl:if>
			<xsl:if test="./v3:quantity/v3:denominator/@unit != '' and ./v3:quantity/v3:denominator/@unit != '1'">
				<xsl:text>&#160;per&#160;</xsl:text>
				<xsl:value-of select="./v3:quantity/v3:denominator/@value"/>
				<xsl:text>&#160;</xsl:text>
				<xsl:value-of select="./v3:quantity/v3:denominator/@unit"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="consumedIn">
		<xsl:for-each select="../v3:consumedIn">
			<span class="titleCase">
				<xsl:call-template name="string-lowercase">
					<xsl:with-param name="text" select="./v3:substanceAdministration/v3:routeCode/@displayName"/>
				</xsl:call-template>
			</span>
			<xsl:call-template name="printSeperator">
				<xsl:with-param name="currentPos" select="position()"/>
				<xsl:with-param name="lastPos" select="last()"/>
				<xsl:with-param name="lastDelimiter">&#160;and</xsl:with-param>
			</xsl:call-template>
		</xsl:for-each>
	</xsl:template>

	<!-- FOOTNOTES -->
	<xsl:param name="footnoteMarks" select="'*&#8224;&#8225;&#167;&#182;#&#0222;&#0223;&#0224;&#0232;&#0240;&#0248;&#0253;&#0163;&#0165;&#0338;&#0339;&#0393;&#0065;&#0066;&#0067;&#0068;&#0069;&#0070;&#0071;&#0072;&#0073;&#0074;&#0075;&#0076;&#0077;&#0078;&#0079;&#0080;&#0081;&#0082;&#0083;&#0084;&#0085;&#0086;&#0087;&#0088;&#0089;&#0090;'"/>
	<xsl:template name="footnoteMark">
		<xsl:param name="target" select="."/>
		<xsl:for-each select="$target[1]">
			<xsl:choose>
				<xsl:when test="ancestor::v3:table">
					<!-- innermost table - FIXME: does not work for the constructed tables -->
					<xsl:variable name="number">
						<xsl:number level="any" from="v3:table" count="v3:footnote"/>
					</xsl:variable>
					<xsl:value-of select="substring($footnoteMarks,$number,1)"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="count(preceding::v3:footnote[not(ancestor::v3:table)])+1"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<!-- changed by Brian Suggs 11-16-05.  Added the [name(..) != 'text']  -->
	<!-- PCR 601 Not displaying foonote mark inside a  table of content -->
	<xsl:template match="v3:footnote[name(..) != 'text']">
		<xsl:param name="isTableOfContent2"/>
		<xsl:if test="$isTableOfContent2!='yes'">
			<xsl:variable name="mark">
				<xsl:call-template name="footnoteMark"/>
			</xsl:variable>
			<xsl:variable name="globalnumber" select="count(preceding::v3:footnote)+1"/>
			<a name="footnote-reference-{$globalnumber}" href="#footnote-{$globalnumber}" class="Sup">
				<xsl:value-of select="$mark"/>
			</a>
		</xsl:if>
	</xsl:template>
	<xsl:template match="v3:footnoteRef">
		<xsl:variable name="ref" select="@IDREF"/>
		<xsl:variable name="target" select="//v3:footnote[@ID=$ref]"/>
		<xsl:variable name="mark">
			<xsl:call-template name="footnoteMark">
				<xsl:with-param name="target" select="$target"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="globalnumber" select="count($target/preceding::v3:footnote)+1"/>
		<a href="#footnote-{$globalnumber}" class="Sup">
			<xsl:value-of select="$mark"/>
		</a>
	</xsl:template>
	<xsl:template name="flushSectionTitleFootnotes">
		<xsl:variable name="footnotes" select="./v3:title/v3:footnote[not(ancestor::v3:table)]"/>
		<xsl:if test="$footnotes">
			<hr class="Footnoterule"/>
			<dl class="Footnote">
				<xsl:apply-templates mode="footnote" select="$footnotes"/>
			</dl>
		</xsl:if>
	</xsl:template>
	<xsl:template name="flushDocumentTitleFootnotes">
		<xsl:variable name="footnotes" select=".//v3:title/v3:footnote[not(ancestor::v3:table)]"/>
		<xsl:if test="$footnotes">
			<hr class="Footnoterule"/>
			<dl class="Footnote">
				<xsl:apply-templates mode="footnote" select="$footnotes"/>
			</dl>
		</xsl:if>
	</xsl:template>
	<!-- comment added by Brian Suggs on 11-11-05: The flushfootnotes template is called at the end of every section -->
	<xsl:template match="v3:flushfootnotes" name="flushfootnotes">
		<xsl:variable name="footnotes" select=".//v3:footnote[not(ancestor::v3:table)]"/>
		<xsl:if test="$footnotes">
			<hr class="Footnoterule"/>
			<dl class="Footnote">
				<xsl:apply-templates mode="footnote" select="$footnotes"/>
			</dl>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="footnote" match="/|node()">
		<xsl:apply-templates mode="footnote" select="node()"/>
	</xsl:template>
	<xsl:template mode="footnote" match="v3:footnote">
		<xsl:variable name="mark">
			<xsl:call-template name="footnoteMark"/>
		</xsl:variable>
		<xsl:variable name="globalnumber" select="count(preceding::v3:footnote)+1"/>
		<dt>
			<a name="footnote-{$globalnumber}" href="#footnote-reference-{$globalnumber}">
				<xsl:value-of select="$mark"/>
			</a>
		</dt>
		<dd>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</dd>
	</xsl:template>
	<xsl:template mode="footnote" match="v3:section|v3:table"/>

	<!-- CROSS REFERENCE linkHtml -->
	<xsl:template name="reference" mode="mixed" match="v3:linkHtml[@href]">
		<xsl:param name="current" select="current()"/>
		<xsl:param name="href" select="$current/@href"/>
		<xsl:param name="target" select="//*[@ID=substring-after($href,'#')]"/>
		<xsl:param name="styleCode" select="$current/@styleCode"/>
		<xsl:variable name="targetTable" select="$target/self::v3:table"/>
		<xsl:choose>
			<xsl:when test="$targetTable and self::v3:linkHtml and $current/node()">
				<a href="#{$targetTable/@ID}">
					<xsl:apply-templates mode="mixed" select="$current/node()"/>
				</a>
			</xsl:when>
			<!-- see PCR 793, we don't generate anchor anymore, we just use what's in the spl -->
			<xsl:otherwise>
				<xsl:variable name="sectionNumberSequence">
					<xsl:apply-templates mode="sectionNumber" select="$target/ancestor-or-self::v3:section"/>
				</xsl:variable>
				<xsl:variable name="nhref">
					<xsl:choose>
						<xsl:when test="starts-with( $href, '#')">							
							<xsl:value-of select="$href"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="contains(@href, 'http')">
									<xsl:value-of select="@href"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat('http://',@href)"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<!-- XXX: can we match the style of the headings? -->				
				<a href="{$href}">	
				
				<xsl:attribute name="href">
					<xsl:value-of select="concat('#s','ection-',translate(@href, '#s',''))"/>
				</xsl:attribute>
				
				
					<xsl:if test="contains($styleCode,'MainTitle') and $target/ancestor-or-self::v3:section[last()]/v3:title">
						<xsl:value-of select="$target/ancestor-or-self::v3:section[last()]/v3:title"/>
					</xsl:if>
					<xsl:if test="contains($styleCode,'SubTitle') and $target/v3:title">
						<xsl:if test="contains($styleCode,'MainTitle') and $target/ancestor-or-self::v3:section[last()]/v3:title">
							<xsl:text>: </xsl:text>
						</xsl:if>
						<xsl:value-of select="$target/v3:title"/>
					</xsl:if>
					<xsl:if test="contains($styleCode,'Number') and $target/ancestor-or-self::v3:section[last()]/v3:title">
						<xsl:text> (</xsl:text>
						<xsl:value-of select="substring($sectionNumberSequence,2)"/>
						<xsl:text>)</xsl:text>
					</xsl:if>
					<xsl:if test="self::v3:linkHtml">
						<xsl:apply-templates mode="mixed" select="$current/node()"/>
					</xsl:if>
				</a>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<!-- SECTION NUMBER MODE -->
	<!-- Special mode to construct a section number. Apply to a sequence of sections on the ancestor-or-self axis. -->
	<!-- Shallow null-transform for anything but sections. -->
	<xsl:template mode="sectionNumber" match="/|@*|node()"/>
	<xsl:template mode="sectionNumber" match="v3:section">
		<!-- Using Standard Section Numbers can be confusing if the sections are mixed standard/non-stancard
				 Example: 8.1 / 8.3 / 8.4 / 8.5 standard, then 8.6 non-standard, because 8.2 was missing, now 8.6 gets numbered as 8.5 

         xsl:param name="standardSection"
							 select="$standardSections//v3:section[@code=current()/v3:code/descendant-or-self::*[(self::v3:code or self::v3:translation) and @codeSystem='2.16.840.1.113883.6.1']/@code]"/>
		<xsl:variable name="standardSectionNumber" select="$standardSection/@number"/>
		<xsl:choose>
			<xsl:when test="$standardSectionNumber">
				<xsl:value-of select="concat('.',$standardSectionNumber)"/>
			</xsl:when>
			<xsl:otherwise -->
		<!-- but when not using standard section numbers, we will count main sections wrong. We shall not count boxed WARNING and Recent Major Changes. -->
				<xsl:value-of select="concat('.',count(parent::v3:component/preceding-sibling::v3:component[v3:section[not(v3:code[@code=$unnumberedSectionCodes])]])+1)"/>
			<!-- /xsl:otherwise>
		</xsl:choose -->
	</xsl:template> 
	<xsl:variable name="unnumberedSectionCodes" select="$standardSections//v3:section[not(number(@number) > 0) and not(@numbered='yes')]/@code"/>
	
	<!-- SECTION MODEL -->
	<xsl:template match="v3:section">
		<xsl:param name="standardSection" select="$standardSections//v3:section[@code=current()/v3:code/descendant-or-self::*[(self::v3:code or self::v3:translation) and @codeSystem='2.16.840.1.113883.6.1']/@code]"/>
		<xsl:param name="sectionLevel" select="count(ancestor-or-self::v3:section)"/>
		<xsl:variable name="sectionNumberSequence">
			<xsl:apply-templates mode="sectionNumber" select="ancestor-or-self::v3:section"/>
		</xsl:variable>
		<div class="Section">
			<xsl:for-each select="v3:code">
				<xsl:attribute name="data-sectionCode"><xsl:value-of select="@code"/></xsl:attribute>
			</xsl:for-each>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
			</xsl:call-template>
			<xsl:for-each select="@ID">
				<!--a name="{.}"/-->
			</xsl:for-each>
			<a name="section-{substring($sectionNumberSequence,2)}" id="section-{substring($sectionNumberSequence,2)}" >
			<xsl:attribute name="name"><xsl:text></xsl:text><xsl:value-of select= "concat('s','ection-',translate(@ID, '#s',''))"/></xsl:attribute>
			<xsl:attribute name="id"><xsl:text></xsl:text><xsl:value-of select= "concat('s','ection-',translate(@ID, '#s',''))"/></xsl:attribute>
			</a>
			<p/>
			<xsl:apply-templates select="v3:title">
				<xsl:with-param name="sectionLevel" select="$sectionLevel"/>
				<xsl:with-param name="sectionNumber" select="substring($sectionNumberSequence,2)"/>
			</xsl:apply-templates>
			<xsl:if test="boolean($show-data)">
				<xsl:apply-templates mode="data" select="."/>
			</xsl:if>
			<xsl:apply-templates select="@*|node()[not(self::v3:title)]"/>
			<xsl:call-template name="flushSectionTitleFootnotes"/>
		</div>
	</xsl:template>
	<xsl:template match="v3:section[v3:code[descendant-or-self::*[self::v3:code or self::v3:translation][@codeSystem='2.16.840.1.113883.6.1' and @code='34066-1']]]" priority="2">
		<!-- boxed warning -->
		<xsl:param name="standardSection" select="$standardSections//v3:section[@code=current()/v3:code/descendant-or-self::*[(self::v3:code or self::v3:translation) and @codeSystem='2.16.840.1.113883.6.1']/@code]"/>
		<xsl:param name="sectionLevel" select="count(ancestor-or-self::v3:section)"/>		
		<xsl:variable name="sectionNumberSequence">
			<xsl:apply-templates mode="sectionNumber" select="ancestor-or-self::v3:section"/>
		</xsl:variable>
		<div>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" select="'Warning'"/>
			</xsl:call-template>
			<xsl:for-each select="@ID">
				<a name="{.}"/>
			</xsl:for-each>
			<!--a name="section-{substring($sectionNumberSequence,2)}"/-->
			<p/>
			<!-- this funny p is used to prevent melting two sub-sections together in condensed style -->
			<xsl:apply-templates select="v3:title">
				<xsl:with-param name="sectionLevel" select="$sectionLevel"/>
				<xsl:with-param name="sectionNumber" select="substring($sectionNumberSequence,2)"/>
			</xsl:apply-templates>
			<xsl:apply-templates select="@*|node()[not(self::v3:title)]"/>
		</div>
	</xsl:template>
	<xsl:template match="v3:section[v3:code[descendant-or-self::*[(self::v3:code or self::v3:translation) and @codeSystem='2.16.840.1.113883.6.1' and @code='43683-2']]]" priority="2">
		<!-- don't display the Recent Major Change section within the FPI -->
	</xsl:template>
	<xsl:template match="v3:section[v3:code[descendant-or-self::*[(self::v3:code or self::v3:translation) and @codeSystem='2.16.840.1.113883.6.1' and @code='48780-1']]]" priority="2">
		<!-- don't display product data section, usually first section before warning -->
	</xsl:template>
	<xsl:template match="v3:title">
		<xsl:param name="sectionLevel" select="count(ancestor::v3:section)"/>
		<xsl:param name="sectionNumber" select="/.."/>
		<xsl:element name="h{$sectionLevel}">
			<xsl:apply-templates select="@*"/>
			<xsl:if test="boolean($show-section-numbers) and $sectionNumber">
				<span class="SectionNumber">
					<xsl:value-of select="$sectionNumber"/>
				</span>
			</xsl:if>
			<xsl:call-template name="additionalStyleAttr"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</xsl:element>	
	</xsl:template>
	<xsl:template match="v3:text[not(parent::v3:observationMedia)]">
		<xsl:apply-templates select="@*"/>
		<xsl:apply-templates mode="mixed" select="node()"/>
		<xsl:call-template name="flushfootnotes">
			<xsl:with-param name="isTableOfContent" select="'no'"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template match="v3:observationMedia/v3:text" priority="2"/>

	<!-- DISPLAY SUBJECT STRUCTURED INFORMATION -->
	<xsl:template match="v3:excerpt|v3:subjectOf"/>

	<!-- PARAGRAPH MODEL -->
	<xsl:template match="v3:paragraph">
		<p>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode">
					<xsl:if test="count(preceding-sibling::v3:paragraph)=0">
						<xsl:text>First</xsl:text>
					</xsl:if>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="additionalStyleAttr"/>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<!-- see note anchoring and PCR 793 -->
			<!-- GS: moved this to after the styleCode and othe attribute handling -->
			<xsl:if test="@ID">
				<a name="{@ID}"/>
			</xsl:if>
			<xsl:apply-templates select="v3:caption"/>
			<xsl:apply-templates mode="mixed" select="node()[not(self::v3:caption)]"/>
		</p>
	</xsl:template>
	<xsl:template match="v3:paragraph/v3:caption">
		<span>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" select="'ParagraphCaption'"/>
			</xsl:call-template>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</span>
	</xsl:template>
	<!-- the old poor man's footnote -->
	<xsl:template match="v3:paragraph[contains(@styleCode,'Footnote') and v3:caption]">
		<dl class="Footnote">
			<dt>
				<xsl:apply-templates mode="mixed" select="node()[self::v3:caption]"/>
			</dt>
			<dd>
				<xsl:apply-templates mode="mixed" select="node()[not(self::v3:caption)]"/>
			</dd>
		</dl>
	</xsl:template>
	<!-- LIST MODEL -->
	<!-- listType='unordered' is default, if any item has a caption,
			 all should have a caption -->
	<xsl:template match="v3:list[not(v3:item/v3:caption)]">
		<xsl:apply-templates select="v3:caption"/>
		<ul>
			<xsl:apply-templates select="@*|node()[not(self::v3:caption)]"/>
		</ul>
	</xsl:template>
	<xsl:template match="v3:list[@listType='ordered' and        not(v3:item/v3:caption)]" priority="1">
		<xsl:apply-templates select="v3:caption"/>
		<ol>
			<xsl:apply-templates select="@*|node()[not(self::v3:caption)]"/>
		</ol>
	</xsl:template>
	<xsl:template match="v3:list/v3:item[not(parent::v3:list/v3:item/v3:caption)]">
		<li>
			<xsl:apply-templates select="@*"/>
			<xsl:call-template name="additionalStyleAttr"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</li> 
	</xsl:template>
	<!-- lists with custom captions -->
	<xsl:template match="v3:list[v3:item/v3:caption]">
		<xsl:apply-templates select="v3:caption"/>
		<dl>
			<xsl:apply-templates select="@*|node()[not(self::v3:caption)]"/>
		</dl>
	</xsl:template>
	<xsl:template match="v3:list/v3:item[parent::v3:list/v3:item/v3:caption]">
		<xsl:apply-templates select="v3:caption"/>
		<dd>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates mode="mixed" select="node()[not(self::v3:caption)]"/>
		</dd>
	</xsl:template>
	<xsl:template match="v3:list/v3:item/v3:caption">
		<dt>
			<xsl:apply-templates select="@*"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</dt>
	</xsl:template>
	<xsl:template match="v3:list/v3:caption">
		<p>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" select="'ListCaption'"/>
			</xsl:call-template>
			<xsl:call-template name="additionalStyleAttr"/>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</p>
	</xsl:template>
	<!-- TABLE MODEL -->
	<xsl:template match="v3:table">
		<!-- see note anchoring and PCR 793 -->
		<xsl:if test="@ID">
			<a name="{@ID}"/>
		</xsl:if>
		<table>
			<xsl:apply-templates select="@*|node()"/>
		</table>
	</xsl:template>
	<xsl:template match="v3:table/@summary|v3:table/@width|v3:table/@border|v3:table/@frame|v3:table/@rules|v3:table/@cellspacing|v3:table/@cellpadding">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="v3:table/v3:caption">
		<caption>
			<xsl:apply-templates select="@*"/>
			<span>
				<xsl:apply-templates mode="mixed" select="node()"/>
			</span>
			<xsl:call-template name="additionalStyleAttr"/>
		</caption>
		<!--xsl:if test="not(preceding-sibling::v3:tfoot) and not(preceding-sibling::v3:tbody)">
				<xsl:call-template name="flushtablefootnotes"/>
				</xsl:if-->
	</xsl:template>
	<xsl:template match="v3:thead">
		<thead>
			<xsl:apply-templates select="@*|node()"/>
		</thead>
	</xsl:template>
	<xsl:template match="v3:thead/@align                       |v3:thead/@char                       |v3:thead/@charoff                       |v3:thead/@valign">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="v3:tfoot" name="flushtablefootnotes">
		<xsl:variable name="allspan" select="count(ancestor::v3:table[1]/v3:colgroup/v3:col|ancestor::v3:table[1]/v3:col)"/>
		<xsl:if test="self::v3:tfoot or ancestor::v3:table[1]//v3:footnote">
			<tfoot>
				<xsl:if test="self::v3:tfoot">
					<xsl:apply-templates select="@*|node()"/>
				</xsl:if>
				<xsl:if test="ancestor::v3:table[1]//v3:footnote">
					<tr>
						<td colspan="{$allspan}" align="left">
							<dl class="Footnote">
										<xsl:apply-templates mode="footnote" select="ancestor::v3:table[1]/node()"/>				
							</dl>
						</td>
					</tr>
				</xsl:if>
			</tfoot>
		</xsl:if>
	</xsl:template>
	<xsl:template match="v3:tfoot/@align                       |v3:tfoot/@char                       |v3:tfoot/@charoff                       |v3:tfoot/@valign">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="v3:tbody">
		<xsl:if test="not(preceding-sibling::v3:tfoot) and not(preceding-sibling::v3:tbody)">
			<xsl:call-template name="flushtablefootnotes"/>
		</xsl:if>
		<tbody>
			<xsl:apply-templates select="@*|node()"/>
		</tbody>
	</xsl:template>
	<xsl:template match="v3:tbody[not(preceding-sibling::v3:thead)]">
		<xsl:if test="not(preceding-sibling::v3:tfoot) and not(preceding-sibling::tbody)">
			<xsl:call-template name="flushtablefootnotes"/>
		</xsl:if>
		<tbody>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" select="'Headless'"/>
			</xsl:call-template>
			<xsl:call-template name="additionalStyleAttr"/>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates select="node()"/>
		</tbody>
	</xsl:template>
	<xsl:template match="v3:tbody/@align                       |v3:tbody/@char                       |v3:tbody/@charoff                       |v3:tbody/@valign">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="v3:tr">
		<tr>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode">
				<xsl:choose>
					 <xsl:when test="contains(ancestor::v3:table/@styleCode, 'Noautorules') or contains(ancestor::v3:section/v3:code/@code, '43683-2') and not(@styleCode)">
						<xsl:text></xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<xsl:if test="position()=1">
							<xsl:text>First </xsl:text>
						</xsl:if>
						<xsl:if test="position()=last()">
							<xsl:text>Last </xsl:text>
						</xsl:if>
					</xsl:otherwise>
				</xsl:choose>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="additionalStyleAttr"/>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates select="node()"/>
		</tr>
	</xsl:template>
	<xsl:template match="v3:tr/@align|v3:tr/@char|v3:tr/@charoff|v3:tr/@valign">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="v3:th">
		<!-- determine our position to find out the associated col -->
		<xsl:param name="position" select="1+count(preceding-sibling::v3:td[not(@colspan[number(.) > 0])]|preceding-sibling::v3:th[not(@colspan[number(.) > 0])])+sum(preceding-sibling::v3:td/@colspan[number(.) > 0]|preceding-sibling::v3:th/@colspan[number(.) > 0])"/>
		<xsl:param name="associatedCol" select="(ancestor::v3:table/v3:colgroup/v3:col|ancestor::v3:table/v3:col)[$position]"/>
		<xsl:param name="associatedColgroup" select="$associatedCol/parent::v3:colgroup"/>
		<th>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode">
					<xsl:if test="not(ancestor::v3:tfoot) and ((contains($associatedColgroup/@styleCode,'Lrule') and not($associatedCol/preceding-sibling::v3:col)) or contains($associatedCol/@styleCode, 'Lrule'))">
						<xsl:text> Lrule </xsl:text>
					</xsl:if>
					<xsl:if test="not(ancestor::v3:tfoot) and ((contains($associatedColgroup/@styleCode,'Rrule') and not($associatedCol/following-sibling::v3:col)) or contains($associatedCol/@styleCode, 'Rrule'))">
						<xsl:text> Rrule </xsl:text>
					</xsl:if>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="additionalStyleAttr"/>
			<xsl:copy-of select="$associatedCol/@align"/>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</th>
	</xsl:template>
	<xsl:template match="v3:th/@align|v3:th/@char|v3:th/@charoff|v3:th/@valign|v3:th/@abbr|v3:th/@axis|v3:th/@headers|v3:th/@scope|v3:th/@rowspan|v3:th/@colspan">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="v3:td">
		<!-- determine our position to find out the associated col -->
		<xsl:param name="position" select="1+count(preceding-sibling::v3:td[not(@colspan[number(.) > 0])]|preceding-sibling::v3:th[not(@colspan[number(.) > 0])])+sum(preceding-sibling::v3:td/@colspan[number(.) > 0]|preceding-sibling::v3:th/@colspan[number(.) > 0])"/>
		
		
		<xsl:param name="associatedCol" select="(ancestor::v3:table/v3:colgroup/v3:col|ancestor::v3:table/v3:col)[$position]"/>
		<xsl:param name="associatedColgroup" select="$associatedCol/parent::v3:colgroup"/>
		<td>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode">
					<xsl:if test="not(ancestor::v3:tfoot) and ((contains($associatedColgroup/@styleCode,'Lrule') and not($associatedCol/preceding-sibling::v3:col)) or contains($associatedCol/@styleCode, 'Lrule'))">
						<xsl:text> Lrule </xsl:text>
					</xsl:if>
					<xsl:if test="not(ancestor::v3:tfoot) and ((contains($associatedColgroup/@styleCode,'Rrule') and not($associatedCol/following-sibling::v3:col)) or contains($associatedCol/@styleCode, 'Rrule'))">
						<xsl:text> Rrule </xsl:text>
					</xsl:if>
				</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="additionalStyleAttr"/>
			<xsl:copy-of select="$associatedCol/@align"/>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</td>
	</xsl:template>
	<xsl:template match="v3:td/@align|v3:td/@char|v3:td/@charoff|v3:td/@valign|v3:td/@abbr|v3:td/@axis|v3:td/@headers|v3:td/@scope|v3:td/@rowspan|v3:td/@colspan">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="v3:colgroup">
		<colgroup>
			<xsl:apply-templates select="@*|node()"/>
		</colgroup>
	</xsl:template>
	<xsl:template match="v3:colgroup/@span|v3:colgroup/@width|v3:colgroup/@align|v3:colgroup/@char|v3:colgroup/@charoff|v3:colgroup/@valign">
		<xsl:copy-of select="."/>
	</xsl:template>
	<xsl:template match="v3:col">
		<col>
			<xsl:apply-templates select="@*|node()"/>
		</col>
	</xsl:template>
	<xsl:template match="v3:col/@span|v3:col/@width|v3:col/@align|v3:col/@char|v3:col/@charoff|v3:col/@valign">
		<xsl:copy-of select="."/>
	</xsl:template>
	<!-- MIXED MODE: where text is rendered as is, even if nested 
			 inside elements that we do not understand  -->
	<!-- based on the deep null-transform -->
	<xsl:template mode="mixed" match="@*|node()">
		<xsl:apply-templates mode="mixed" select="@*|node()"/>
	</xsl:template>
	<xsl:template mode="mixed" match="text()" priority="0">
		<xsl:copy/>
	</xsl:template>
	<xsl:template mode="mixed" match="v3:content">
		<span>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCodeSequence" select="@emphasis|@revised"/>
			</xsl:call-template>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<!-- see note anchoring and PCR 793 -->
			<!-- GS: moved this till after styleCode and other attribute handling -->
			<xsl:if test="@ID">
				<a name="{@ID}"/>
			</xsl:if>
			<xsl:apply-templates mode="mixed" select="node()"/>			
		</span>
	</xsl:template>
	<xsl:template mode="mixed" match="v3:content[@emphasis='yes']" priority="1">
		<em>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCodeSequence" select="@revised"/>
			</xsl:call-template>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</em>
	</xsl:template>
	<xsl:template mode="mixed" match="v3:content[@emphasis]">
		<em>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCodeSequence" select="@emphasis|@revised"/>
			</xsl:call-template>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</em>
	</xsl:template>
	<!-- We don't use <sub> and <sup> elements here because IE produces
			 ugly uneven line spacing. -->
	<xsl:template mode="mixed" match="v3:sub">
		<span>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" select="'Sub'"/>
			</xsl:call-template>
			<xsl:apply-templates mode="mixed" select="@*|node()"/>
		</span>
	</xsl:template>
	<xsl:template mode="mixed" match="v3:sup">
		<span>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" select="'Sup'"/>
			</xsl:call-template>
			<xsl:apply-templates mode="mixed" select="@*|node()"/>
		</span>
	</xsl:template>
	<xsl:template mode="mixed" match="v3:br">
		<br/>
	</xsl:template>
	<xsl:template mode="mixed" priority="1" match="v3:renderMultiMedia[@referencedObject and (ancestor::v3:paragraph or ancestor::v3:td or ancestor::v3:th)]">
		<xsl:variable name="reference" select="@referencedObject"/>
		<!-- see note anchoring and PCR 793 -->
		<xsl:if test="@ID">
			<a name="{@ID}"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="boolean(//v3:observationMedia[@ID=$reference]//v3:text)">
				<img alt="{//v3:observationMedia[@ID=$reference]//v3:text}" src="{//v3:observationMedia[@ID=$reference]//v3:reference/@value}">
					<xsl:apply-templates select="@*"/>
				</img>
			</xsl:when>
			<xsl:when test="not(boolean(//v3:observationMedia[@ID=$reference]//v3:text))">
				<img alt="Image from Drug Label Content" src="{//v3:observationMedia[@ID=$reference]//v3:reference/@value}">
					<xsl:apply-templates select="@*"/>
				</img>
			</xsl:when>
		</xsl:choose>
		<xsl:apply-templates mode="notCentered" select="v3:caption"/>
	</xsl:template>
	<xsl:template mode="mixed" match="v3:renderMultiMedia[@referencedObject]">
		<xsl:variable name="reference" select="@referencedObject"/>
		<div>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" select="'Figure'"/>
			</xsl:call-template>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			
			<!-- see note anchoring and PCR 793 -->
			<xsl:if test="@ID">
				<a name="{@ID}"/>
			</xsl:if>
			
			<xsl:choose>
				<xsl:when test="boolean(//v3:observationMedia[@ID=$reference]//v3:text)">
					<img alt="{//v3:observationMedia[@ID=$reference]//v3:text}" src="{//v3:observationMedia[@ID=$reference]//v3:reference/@value}">
						<xsl:apply-templates select="@*"/>
					</img>
				</xsl:when>
				<xsl:when test="not(boolean(//v3:observationMedia[@ID=$reference]//v3:text))">
					<img alt="Image from Drug Label Content" src="{//v3:observationMedia[@ID=$reference]//v3:reference/@value}">
						<xsl:apply-templates select="@*"/>
					</img>
				</xsl:when>
			</xsl:choose>			
			<xsl:apply-templates select="v3:caption"/>
		</div>
	</xsl:template>
	<xsl:template match="v3:renderMultiMedia/v3:caption">
		<p>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" 
												select="'MultiMediaCaption'"/>
			</xsl:call-template>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</p>
	</xsl:template>
	<xsl:template mode="notCentered" match="v3:renderMultiMedia/v3:caption">
		<p>
			<xsl:call-template name="styleCodeAttr">
				<xsl:with-param name="styleCode" select="@styleCode"/>
				<xsl:with-param name="additionalStyleCode" select="'MultiMediaCaptionNotCentered'"/>
			</xsl:call-template>
			<xsl:apply-templates select="@*[not(local-name(.)='styleCode')]"/>
			<xsl:apply-templates mode="mixed" select="node()"/>
		</p>
	</xsl:template>
	<xsl:template mode="mixed" match="v3:paragraph|v3:list|v3:table|v3:footnote|v3:footnoteRef|v3:flushfootnotes">
		<xsl:param name="isTableOfContent"/>
		<xsl:choose>
			<xsl:when test="$isTableOfContent='yes'">
				<xsl:apply-templates select=".">
					<xsl:with-param name="isTableOfContent2" select="'yes'"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select=".">
					<xsl:with-param name="isTableOfContent2" select="'no'"/>
				</xsl:apply-templates>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- MODE: DATA - deep null transform -->
	<xsl:template mode="data" match="*">
		<xsl:apply-templates mode="data" select="node()"/>
	</xsl:template>
	<xsl:template mode="data" match="text()">
		<xsl:copy/>
	</xsl:template>
	<xsl:template mode="data" match="*[@displayName and not(@code)]">
		<xsl:value-of select="@displayName"/>
	</xsl:template>
	<xsl:template mode="data" match="*[not(@displayName) and @code]">
		<xsl:value-of select="@code"/>
	</xsl:template>
	<xsl:template mode="data" match="*[@displayName and @code]">
		<xsl:value-of select="@displayName"/>
		<xsl:text> (</xsl:text>
		<xsl:value-of select="@code"/>
		<xsl:text>)</xsl:text>
	</xsl:template>
	<!-- add by Brian Suggs on 11-14-05. This will take care of the characteristic unit attribute that wasn't before taken care of -->
	<xsl:template mode="data" match="*[@value and @unit]" priority="1">
		<xsl:value-of select="@value"/>&#160;<xsl:value-of select="@unit"/>
	</xsl:template>
	<xsl:template mode="data" match="*[@value and not(@displayName)]">
		<xsl:value-of select="@value"/>
	</xsl:template>
	<xsl:template mode="data" match="*[@value and @displayName]">
		<xsl:value-of select="@value"/>
		<xsl:text>&#160;</xsl:text>
		<xsl:value-of select="@displayName"/>
	</xsl:template>
	<xsl:template mode="data" match="*[@value and (@xsi:type='TS' or contains(local-name(),'Time'))]" priority="1">
		<xsl:param name="displayMonth">true</xsl:param>
		<xsl:param name="displayDay">true</xsl:param>
		<xsl:param name="displayYear">true</xsl:param>
		<xsl:param name="delimiter">/</xsl:param>
		<xsl:variable name="year" select="substring(@value,1,4)"/>
		<xsl:variable name="month" select="substring(@value,5,2)"/>
		<xsl:variable name="day" select="substring(@value,7,2)"/>
		<!-- changed by Brian Suggs 11-13-05.  Changes made to display date in MM/DD/YYYY format instead of DD/MM/YYYY format -->
		<xsl:if test="$displayMonth = 'true'">
			<xsl:value-of select="$month"/>
			<xsl:value-of select="$delimiter"/>
		</xsl:if>
		<xsl:if test="$displayDay = 'true'">
			<xsl:value-of select="$day"/>
			<xsl:value-of select="$delimiter"/>
		</xsl:if>
		<xsl:if test="$displayYear = 'true'">
			<xsl:value-of select="$year"/>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="data" match="*[v3:numerator]">
		<xsl:apply-templates mode="data" select="v3:numerator"/>
		<xsl:if test="v3:denominator[not(@value='1' and (not(@unit) or @unit='1'))]">
			<xsl:text> : </xsl:text>
			<xsl:apply-templates mode="data" select="v3:denominator"/>
		</xsl:if>
	</xsl:template>
	<xsl:template name="effectiveDate">
		<div class="EffectiveDate">
			<!-- changed by Brian Suggs 11-13-05. Added the Effective Date: text back in so that people will know what this date is for. -->
			<!-- changed by Brian Suggs 08-18-06. Modified text to state "Revised:" as per PCR 528 -->
			<xsl:if test="v3:effectiveTime[@value != '']">
				<xsl:text>Revised: </xsl:text>
				<!-- changed by Brian Suggs 08-18-06. The effective date will now only display the month and year in the following format MM/YYYY (e.g. 08/2006). Code changed per PCR 528 -->
				<xsl:apply-templates mode="data" select="v3:effectiveTime">
					<xsl:with-param name="displayMonth">true</xsl:with-param>
					<xsl:with-param name="displayDay">false</xsl:with-param>
					<xsl:with-param name="displayYear">true</xsl:with-param>
					<xsl:with-param name="delimiter">/</xsl:with-param>
				</xsl:apply-templates>
				<xsl:if test="$update-check-url-base">
					<xsl:variable name="url" select="concat($update-check-url-base, v3:setId/@root)"/>
					<xsl:text> </xsl:text>
					<a href="{$url}">
						<xsl:text>Click here to check for updated version.</xsl:text>
					</a>
				</xsl:if>
				<div class="DocumentMetadata">
					<div>
						<xsl:text>Document Id: </xsl:text>
						<xsl:value-of select="/v3:document/v3:id/@root"/>
					</div>
					<div>
						<xsl:text>Set id: </xsl:text>
						<xsl:value-of select="/v3:document/v3:setId/@root"/>
					</div>
					<div>
						<xsl:text>Version: </xsl:text>
						<xsl:value-of select="/v3:document/v3:versionNumber/@value"/>
					</div>
					<div>
						<xsl:text>Effective Time: </xsl:text>
						<xsl:value-of select="/v3:document/v3:effectiveTime/@value"/>
					</div>
				</div>
			</xsl:if>
		</div>
	</xsl:template>
	<xsl:template name="DistributorName">
		<div class="DistributorName">				
			<xsl:if test="v3:author/v3:assignedEntity/v3:representedOrganization/v3:name != ''">					
				<xsl:value-of select="v3:author/v3:assignedEntity/v3:representedOrganization/v3:name"/>					
			</xsl:if>
		</div>
	</xsl:template>
	<!-- block at sections unless handled specially -->
	<xsl:template mode="data" match="v3:section"/>
	<!-- This section will display all of the subject information in one easy to read table. This view is replacing the previous display of the data elements. -->
	<xsl:template mode="subjects" match="/|@*|node()">
		<xsl:apply-templates mode="subjects" select="@*|node()"/>
	</xsl:template>
	<xsl:template mode="subjects" match="v3:section/v3:subject/v3:manufacturedProduct/*[self::v3:manufacturedProduct or self::v3:manufacturedMedicine]">
		<table class="contentTablePetite" cellSpacing="0" cellPadding="3" width="100%">
			<tbody>
				<xsl:call-template name="piMedNames"/>
				<xsl:call-template name="ProductInfoBasic"/>
				<xsl:choose>
					<!-- if this is a multi-component subject then call to parts template -->
					<xsl:when test="v3:part">
						<xsl:apply-templates mode="subjects" select="v3:part"/>
					</xsl:when>
					<!-- otherwise it is a single product and we simply need to display the ingredients, imprint and packaging. -->
					<xsl:otherwise>
						<xsl:call-template name="ProductInfoIng"/>
					</xsl:otherwise>
				</xsl:choose>
				<tr>
					<td>						
						<xsl:call-template name="image">
							<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLIMAGE']"/>
						</xsl:call-template>
					</td>
				</tr>
				<tr>
					<td class="normalizer">
						<xsl:call-template name="MarketingInfo"/>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>


	<!-- XXX: named templates, really not a good idea, but we can't fix the mess all at once 
			 These used to be sometimes incompletely defined modes with templates matching everything, leading to default template messes.
			 Now they are all named templates that are to be invoked in exactly one context.
			 Usually any of these templates are to be invoked in the product entity context, that way we avoid so many navigation choices
			 to get to role information and additional information it is easier to just step up.
	-->
	<xsl:template name="piMedNames">
		<xsl:variable name="medName">
			<xsl:call-template name="string-uppercase">
				<xsl:with-param name="text">
					<xsl:copy><xsl:apply-templates mode="specialCus" select="v3:name" /></xsl:copy>
				</xsl:with-param>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="genMedName">
			<xsl:call-template name="string-uppercase">
				<xsl:with-param name="text" select="v3:asEntityWithGeneric/v3:genericMedicine/v3:name|v3:asSpecializedKind/v3:generalizedMaterialKind/v3:code[@codeSystem = '2.16.840.1.113883.6.276'  or @codeSystem = '2.16.840.1.113883.6.303']/@displayName"/>
			</xsl:call-template>
		</xsl:variable>		
		
		<tr>
			<td class="contentTableTitle">
				<strong>
					<xsl:value-of select="$medName"/>&#160;		
					<xsl:call-template name="string-uppercase">
						<xsl:with-param name="text" select="v3:name/v3:suffix"/>
					</xsl:call-template>	
				</strong>
				<br/>
				<span class="contentTableReg">
					<xsl:call-template name="string-lowercase">
						<xsl:with-param name="text" select="$genMedName"/>
					</xsl:call-template>
					<xsl:text> </xsl:text>
					<xsl:call-template name="string-lowercase">
						<xsl:with-param name="text" select="v3:formCode/@displayName"/>
					</xsl:call-template>
					<!-- xsl:choose>
							 <xsl:when test="v3:asEntityWithGeneric">
							 <xsl:text> (drug) </xsl:text>
							 </xsl:when>
							 <xsl:when test="v3:asSpecializedKind[v3:generalizedMaterialKind[v3:code[@codeSystem = '2.16.840.1.113883.6.276' or @codeSystem = '2.16.840.1.113883.6.303']]]">
							 <xsl:text> (device) </xsl:text>
							 </xsl:when>
							 </xsl:choose -->
				</span>
			</td>
		</tr>
	</xsl:template>

	<xsl:template name="ProductInfoBasic">
		<tr>
			<td>
				<table width="100%" cellpadding="5" cellspacing="0" class="formTablePetite">
					<tr>
						<td colspan="4" class="formHeadingTitle">Product Information</td>
					</tr>
					<tr class="formTableRowAlt">							
						<xsl:if test="not(../../v3:part)">
							<td class="formLabel">Product Type</td>
							<td class="formItem">
								<!-- XXX: can't do in XSLT 1.0: xsl:value-of select="replace($documentTypes/v3:document[@code = $root/v3:document/v3:code/@code]/v3:title,'(^| )label( |$)',' ','i')"/ -->
								<xsl:value-of select="$documentTypes/v3:document[@code = $root/v3:document/v3:code/@code]/v3:title"/>
							</td>
						</xsl:if>
						<xsl:for-each select="v3:code/@code">
							<td class="formLabel">
								<xsl:text>Item Code (Source)</xsl:text>
							</td>
							<td class="formItem">
								<xsl:for-each select="$itemCodeSystems/label[@codeSystem = current()/../@codeSystem][approval/@code = current()/../../../v3:subjectOf/v3:approval/v3:code/@code or @drug = count(current()/../../v3:asEntityWithGeneric)][1]/@name">
									<xsl:value-of select="."/>
									<xsl:text>:</xsl:text>
								</xsl:for-each>
								<xsl:value-of select="."/>
								<xsl:for-each select="../../v3:asEquivalentEntity[v3:code/@code = 'C64637'][1]/v3:definingMaterialKind/v3:code/@code[string-length(.) > 0]">
									<xsl:text>(</xsl:text>
									<xsl:for-each select="$itemCodeSystems/label[@codeSystem = current()/../@codeSystem][approval/@code = current()/../../../v3:subjectOf/v3:approval/v3:code/@code or @drug = count(current()/../../../../v3:asEntityWithGeneric)][1]/@name">
										<xsl:value-of select="."/>
										<xsl:text>:</xsl:text>
									</xsl:for-each>
									<xsl:value-of select="."/>
									<xsl:text>)</xsl:text>
								</xsl:for-each>
							</td>
						</xsl:for-each>
					</tr>
					<xsl:if test="../v3:subjectOf/v3:policy/v3:code/@displayName or  ../v3:consumedIn/v3:substanceAdministration/v3:routeCode and not(v3:part)">
						<tr class="formTableRow">
							<td width="30%" class="formLabel">Route of Administration</td>
							<td class="formItem">
								<xsl:for-each select="../v3:consumedIn/v3:substanceAdministration/v3:routeCode">
									<xsl:if test="position() > 1">, </xsl:if>
									<xsl:value-of select="@displayName"/>
								</xsl:for-each>
							</td>
							<td width="30%" class="formLabel">DEA Schedule</td>
							<td class="formItem">	
								<xsl:value-of select="../v3:subjectOf/v3:policy/v3:code/@displayName"/>&#160;&#160;&#160;&#160;
							</td>
						</tr>
					</xsl:if>
				</table>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="ProductInfoIng">		
		<xsl:if test="v3:ingredient[starts-with(@classCode,'ACTI')]|v3:activeIngredient">
			<tr>
				<td>
					<xsl:call-template name="ActiveIngredients"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="v3:ingredient[@classCode = 'IACT']|v3:inactiveIngredient">
			<tr>
				<td>
					<xsl:call-template name="InactiveIngredients"/>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="v3:ingredient[not(@classCode='IACT' or starts-with(@classCode,'ACTI'))]">
			<tr>
				<td>
					<xsl:call-template name="otherIngredients"/>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td>
				<xsl:choose>
					<xsl:when test="v3:asEntityWithGeneric and ../v3:subjectOf/v3:characteristic/v3:code[starts-with(@code, 'SPL')]">
						<xsl:call-template name="characteristics-old"/>
					</xsl:when>
					<xsl:when test="../v3:subjectOf/v3:characteristic">
						<xsl:call-template name="characteristics-new"/>
					</xsl:when>
				</xsl:choose>
			</td>
		</tr>
		<xsl:if test="v3:asContent">
			<tr>
				<td>
					<xsl:call-template name="packaging">
						<xsl:with-param name="path" select="."/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<xsl:if test="v3:instanceOfKind">
			<tr>
				<td colspan="4">
					<table width="100%" cellpadding="3" cellspacing="0" class="formTablePetite">
						<xsl:apply-templates mode="ldd" select="v3:instanceOfKind"/>
					</table>
				</td>
			</tr>
		</xsl:if>
	</xsl:template>	
	
	<xsl:template mode="subjects" match="v3:part/v3:partProduct|v3:part/v3:partMedicine">
		<!-- only display the outer part packaging once -->
		<xsl:if test="not(../preceding-sibling::v3:part)">
			<xsl:if test="../../v3:asContent">
				<tr>
					<td>
						<xsl:call-template name="packaging">
							<xsl:with-param name="path" select="../.."/>
						</xsl:call-template>
					</td>
				</tr>
			</xsl:if>
			<tr>
				<td>
					<xsl:call-template name="partQuantity">
						<xsl:with-param name="path" select="../.."/>
					</xsl:call-template>
				</td>
			</tr>
		</xsl:if>
		<tr>
			<td>
				<table width="100%" cellspacing="0" cellpadding="5">
					<tr>
						<td class="contentTableTitle">Part <xsl:value-of select="count(../preceding-sibling::v3:part)+1"/> of <xsl:value-of select="count(../../v3:part)"/></td>
					</tr>
					<xsl:call-template name="piMedNames"/>
				</table>
			</td>
		</tr>
		<xsl:call-template name="ProductInfoBasic"/>
		<xsl:call-template name="ProductInfoIng"/>
		<tr>
			<td>
				<xsl:call-template name="image">
					<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLIMAGE']"/>
				</xsl:call-template>
			</td>
		</tr>
		<tr>
			<td class="normalizer">
				<xsl:call-template name="MarketingInfo"/>
			</td>
		</tr>
	</xsl:template>

	<!-- display the ingredient information (both active and inactive) -->
	<xsl:template name="ActiveIngredients">
		<table width="100%" cellpadding="3" cellspacing="0" class="formTablePetite">
			<tr>
				<td colspan="3" class="formHeadingTitle">Active Ingredient/Active Moiety</td>
			</tr>
			<tr>
				<td class="formTitle">Ingredient Name</td>
				<td class="formTitle">Basis of Strength</td>
				<td class="formTitle">Strength</td>
			</tr>
			<xsl:if test="not(v3:ingredient[starts-with(@classCode, 'ACTI')]|v3:activeIngredient)">
				<tr>
					<td colspan="3" class="formItem" align="center">No Active Ingredients Found</td>
				</tr>
			</xsl:if>
			<xsl:for-each select="v3:ingredient[starts-with(@classCode, 'ACTI')]|v3:activeIngredient">
				<tr>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
							<xsl:otherwise>formTableRowAlt</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:for-each select="(v3:ingredientSubstance|v3:activeIngredientSubstance)[1]">
						<td class="formItem">
							<strong>
								<xsl:value-of select="v3:name"/>
							</strong>
							<xsl:if test="normalize-space(v3:activeMoiety/v3:activeMoiety/v3:name)">
								<xsl:text> (</xsl:text>
								<xsl:for-each select="v3:activeMoiety/v3:activeMoiety/v3:name">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()"> and </xsl:if>
								</xsl:for-each>
								<xsl:text>) </xsl:text>
							</xsl:if>
						</td>
						<td class="formItem">
							<xsl:choose>
								<xsl:when test="../@classCode='ACTIR'">
									<xsl:value-of select="v3:asEquivalentSubstance/v3:definingSubstance/v3:name"/>
								</xsl:when>
								<xsl:when test="../@classCode='ACTIB'">
									<xsl:value-of select="v3:name"/>
								</xsl:when>
								<xsl:when test="../@classCode='ACTIM'">
									<xsl:value-of select="v3:activeMoiety/v3:activeMoiety/v3:name"/>
								</xsl:when>
							</xsl:choose>
						</td>
					</xsl:for-each>
					<td class="formItem">
						<xsl:value-of select="v3:quantity/v3:numerator/@value"/>&#160;<xsl:if test="normalize-space(v3:quantity/v3:numerator/@unit)!='1'"><xsl:value-of select="v3:quantity/v3:numerator/@unit"/></xsl:if>
						<xsl:if test="(v3:quantity/v3:denominator/@value and normalize-space(v3:quantity/v3:denominator/@value)!='1') 
													or (v3:quantity/v3:denominator/@unit and normalize-space(v3:quantity/v3:denominator/@unit)!='1')"> &#160;in&#160;<xsl:value-of select="v3:quantity/v3:denominator/@value"
													/>&#160;<xsl:if test="normalize-space(v3:quantity/v3:denominator/@unit)!='1'"><xsl:value-of select="v3:quantity/v3:denominator/@unit"/>
						</xsl:if></xsl:if>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template name="InactiveIngredients">
		<table width="100%" cellpadding="3" cellspacing="0" class="formTablePetite">
			<tr>
				<!-- see PCR 801, just make the header bigger -->
				<td colspan="2" class="formHeadingTitle">Inactive Ingredients</td>
			</tr>
			<tr>
				<td class="formTitle">Ingredient Name</td>
				<td class="formTitle">Strength</td>
			</tr>
			<xsl:if test="not(v3:ingredient[@classCode='IACT']|v3:inactiveIngredient)">
				<tr>
					<td colspan="2" class="formItem" align="center">No Inactive Ingredients Found</td>
				</tr>
			</xsl:if>			
			<xsl:for-each select="v3:ingredient[@classCode='IACT']|v3:inactiveIngredient">
				<tr>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
							<xsl:otherwise>formTableRowAlt</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<xsl:for-each select="(v3:ingredientSubstance|v3:inactiveIngredientSubstance)[1]">
						<td class="formItem">
							<strong>
								<xsl:value-of select="v3:name"/>
							</strong>
							<xsl:if test="normalize-space(v3:activeMoiety/v3:activeMoiety/v3:name)">
								<xsl:text> (</xsl:text>
								<xsl:value-of select="v3:activeMoiety/v3:activeMoiety/v3:name"/>
								<xsl:text>) </xsl:text>
							</xsl:if>
						</td>
					</xsl:for-each>
					<td class="formItem">
						<xsl:value-of select="v3:quantity/v3:numerator/@value"/>&#160;<xsl:if test="normalize-space(v3:quantity/v3:numerator/@unit)!='1'"><xsl:value-of select="v3:quantity/v3:numerator/@unit"/></xsl:if>
						<xsl:if test="v3:quantity/v3:denominator/@value and normalize-space(v3:quantity/v3:denominator/@unit)!='1'"> &#160;in&#160;<xsl:value-of select="v3:quantity/v3:denominator/@value"
						/>&#160;<xsl:if test="normalize-space(v3:quantity/v3:denominator/@unit)!='1'"><xsl:value-of select="v3:quantity/v3:denominator/@unit"/>
						</xsl:if></xsl:if>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template name="otherIngredients">
		<table width="100%" cellpadding="3" cellspacing="0" class="formTablePetite">
			<tr>
				<td colspan="3" class="formHeadingTitle">
					<xsl:if test="v3:ingredient[@classCode = 'INGR' or starts-with(@classCode,'ACTI')]">Other </xsl:if>
					<xsl:text>Ingredients</xsl:text>
				</td>
			</tr>
			<tr>
				<td class="formTitle">Ingredient Kind</td>
				<td class="formTitle">Ingredient Name</td>
				<td class="formTitle">Quantity</td>
			</tr>
			<xsl:for-each select="v3:ingredient[not(@classCode='IACT' or starts-with(@classCode,'ACTI'))]">
				<tr>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
							<xsl:otherwise>formTableRowAlt</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<td class="formItem">
						<xsl:choose>
							<xsl:when test="@classCode = 'BASE'">Base</xsl:when>
							<xsl:when test="@classCode = 'ADTV'">Additive</xsl:when>
							<xsl:when test="@classCode = 'CNTM' and v3:quantity/v3:numerator/@value='0'">Does not contain</xsl:when>
							<xsl:when test="@classCode = 'CNTM'">May contain</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@classCode"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
					<td class="formItem">
						<strong>
							<xsl:value-of select="v3:ingredientSubstance/v3:name"/>
						</strong>
						<xsl:if test="normalize-space(v3:ingredientSubstance/v3:activeMoiety/v3:activeMoiety/v3:name)"> (<xsl:value-of
						select="v3:ingredientSubstance/v3:activeMoiety/v3:activeMoiety/v3:name"/>) </xsl:if>
					</td>
					<td class="formItem">
						<xsl:value-of select="v3:quantity/v3:numerator/@value"/>&#160;<xsl:if test="normalize-space(v3:quantity/v3:numerator/@unit)!='1'"><xsl:value-of select="v3:quantity/v3:numerator/@unit"/></xsl:if>
						<xsl:if test="v3:quantity/v3:denominator/@value and normalize-space(v3:quantity/v3:denominator/@unit)!='1'"> &#160;in&#160;<xsl:value-of select="v3:quantity/v3:denominator/@value"
						/>&#160;<xsl:if test="normalize-space(v3:quantity/v3:denominator/@unit)!='1'"><xsl:value-of select="v3:quantity/v3:denominator/@unit"/>
						</xsl:if></xsl:if>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<!-- display the imprint information in the specified order.  a apply-template could be used here but then we would not be able to control what order the
			 imprint information is displayed in since there isn't a requirement specifying that the characteristic must be programmed in a certain order-->
	<xsl:template name="characteristics-old">
		<table width="100%" cellpadding="3" cellspacing="0" class="formTablePetite">
			<tr>
				<td colspan="4" class="formHeadingTitle">Product Characteristics</td>
			</tr>
			<tr class="formTableRowAlt">
				<xsl:call-template name="color">
					<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLCOLOR']"/>
				</xsl:call-template>
				<xsl:call-template name="score">
					<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLSCORE']"/>
				</xsl:call-template>
			</tr>
			<tr class="formTableRow">
				<xsl:call-template name="shape">
					<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLSHAPE']"/>
				</xsl:call-template>
				<xsl:call-template name="size">
					<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLSIZE']"/>
				</xsl:call-template>
			</tr>
			<tr class="formTableRowAlt">
				<xsl:call-template name="flavor">
					<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLFLAVOR']"/>
				</xsl:call-template>
				<xsl:call-template name="imprintCode">
					<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLIMPRINT']"/>
				</xsl:call-template>
			</tr>
			<tr class="formTableRow">
				<xsl:call-template name="contains">
					<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLCONTAINS']"/>
				</xsl:call-template>
			</tr>
			<xsl:if test="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLCOATING']|../v3:subjectOf/v3:characteristic[v3:code/@code='SPLSYMBOL']">
				<tr class="formTableRowAlt">
					<xsl:call-template name="coating">
						<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLCOATING']"/>
					</xsl:call-template>
					<xsl:call-template name="symbol">
						<xsl:with-param name="path" select="../v3:subjectOf/v3:characteristic[v3:code/@code='SPLSYMBOL']"/>
					</xsl:call-template>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<xsl:template name="characteristics-new">
		<table width="100%" cellpadding="3" cellspacing="0" class="formTablePetite">
			<tr>
				<td colspan="4" class="formHeadingTitle">Product Characteristics</td>
			</tr>	
			<xsl:apply-templates mode="characteristics" select="../v3:subjectOf/v3:characteristic">
				<xsl:sort select="count($CHARACTERISTICS/*/*/v3:characteristic[v3:code[@code = current()/v3:code/@code and @codeSystem = current()/v3:code/@codeSystem]][1]/preceding::*)"/>
			</xsl:apply-templates>
		</table>
	</xsl:template>

	<xsl:template mode="characteristics" match="/|@*|node()">
		<xsl:apply-templates mode="characteristics" select="@*|node()"/>
	</xsl:template>
	<xsl:variable name="CHARACTERISTICS" select="document('characteristic.xml')"/>
	<xsl:template mode="characteristics" match="v3:characteristic">
		<xsl:variable name="def" select="$CHARACTERISTICS/*/*/v3:characteristic[v3:code[@code = current()/v3:code/@code and @codeSystem = current()/v3:code/@codeSystem]][1]"/>
		<tr>
			<td class="formLabel">
				<xsl:variable name="name" select="($def/v3:code/@displayName|$def/v3:code/@p:displayName)[1]" xmlns:p="http://pragmaticdata.com/xforms"/>
				<xsl:value-of select="$name"/>
				<xsl:if test="not($name)">
					<xsl:text>(</xsl:text>
					<xsl:value-of select="v3:code/@code"/>
					<xsl:text>)</xsl:text>
				</xsl:if>
			</td>
			<xsl:apply-templates mode="characteristics" select="v3:value">
				<xsl:with-param name="def" select="$def"/>
			</xsl:apply-templates>
			<xsl:if test="$def/v3:value/@unit = v3:value/@unit and number($def/v3:value/@value) > 0 and number(v3:value/@value) > 0">
				<td class="formItem">
					<xsl:value-of select="round(number(v3:value/@value) * 100 div number($def/v3:value/@value))"/>
					<xsl:text> %DV</xsl:text>
				</td>
			</xsl:if>
		</tr>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'ST']">
		<td class="formItem" colspan="2"><xsl:value-of select="text()"/></td>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'BL']">
		<td class="formItem" colspan="2"><xsl:value-of select="@value"/></td>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'PQ']">
		<td class="formItem"><xsl:value-of select="@value"/></td>
		<td class="formItem"><xsl:value-of select="@unit"/></td>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'INT']">
		<td class="formItem"><xsl:value-of select="@value"/></td>
		<td class="formItem"/>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'CV' or @xsi:type = 'CE' or @xsi:type = 'CE']">
		<td class="formItem">
			<xsl:value-of select=".//@displayName[1]"/>
		</td>
		<td class="formItem">
			<xsl:value-of select=".//@code[1]"/>
		</td>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'REAL']">
		<td class="formItem"><xsl:value-of select="@value"/></td>
		<td class="formItem"/>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'IVL_PQ' and v3:high/@unit = v3:low/@unit]" priority="2">
		<td class="formItem">
			<xsl:value-of select="v3:low/@value"/>
			<xsl:text>-</xsl:text>
			<xsl:value-of select="v3:high/@value"/>
		</td>
		<td><xsl:value-of select="v3:low/@unit"/></td>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'IVL_PQ' and v3:high/@value and not(v3:low/@value)]">
		<td class="formItem">
			<xsl:text>&lt;</xsl:text>
			<xsl:value-of select="v3:high/@value"/>
		</td>
		<td class="formItem"><xsl:value-of select="v3:high/@unit"/></td>
	</xsl:template>
	<xsl:template mode="characteristics" match="v3:value[@xsi:type = 'IVL_PQ' and v3:low/@value and not(v3:high/@value)]">
		<td class="formItem">
			<xsl:text>></xsl:text>
			<xsl:value-of select="v3:low/@value"/>
		</td>
		<td class="formItem"><xsl:value-of select="v3:low/@unit"/></td>
	</xsl:template>


	<!-- display the imprint characteristic color -->
	<xsl:template name="color">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Color</td>
		<td class="formItem">
			<xsl:for-each select="$path/v3:value">
				<xsl:if test="position() > 1">,&#160;</xsl:if>
				<xsl:value-of select="./@displayName"/>
				<xsl:if test="normalize-space(./v3:originalText)"> (<xsl:value-of select="./v3:originalText"/>) </xsl:if>
			</xsl:for-each>
			<xsl:if test="not($path/v3:value)">&#160;&#160;&#160;&#160;</xsl:if>
		</td>
	</xsl:template>
	<!-- display the imprint characteristic score -->
	<xsl:template name="score">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Score</td>
		<td class="formItem">
			<xsl:choose>
				<xsl:when test="$path/v3:value/@nullFlavor='OTH'">score with uneven pieces</xsl:when>
				<xsl:when test="not($path/v3:value)">&#160;&#160;&#160;&#160;</xsl:when>
				<xsl:when test="$path/v3:value/@value = '1'">no score</xsl:when>
				<xsl:otherwise><xsl:value-of select="$path/v3:value/@value"/> pieces</xsl:otherwise>
			</xsl:choose>
		</td>
	</xsl:template>
	<!-- display the imprint characteristic shape -->
	<xsl:template name="shape">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Shape</td>
		<td class="formItem">
			<xsl:value-of select="$path/v3:value/@displayName"/>
			<xsl:if test="normalize-space($path/v3:value/v3:originalText)"> (<xsl:value-of select="$path/v3:value/v3:originalText"/>) </xsl:if>
		</td>
	</xsl:template>
	<!-- display the imprint characteristic flavor -->
	<xsl:template name="flavor">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Flavor</td>
		<td class="formItem">			
			<xsl:for-each select="$path/v3:value">
				<xsl:if test="position() > 1">,&#160;</xsl:if>
				<xsl:value-of select="./@displayName"/>
				<xsl:if test="normalize-space(./v3:originalText)"> (<xsl:value-of select="./v3:originalText"/>) </xsl:if>
			</xsl:for-each>
		</td>
	</xsl:template>
	<!-- display the imprint characteristic code -->
	<xsl:template name="imprintCode">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Imprint Code</td>
		<td class="formItem">
			<xsl:value-of select="$path[v3:value/@xsi:type='ST']"/>
		</td>
	</xsl:template>
	<!-- display the imprint characteristic size -->
	<xsl:template name="size">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Size</td>
		<td class="formItem">
			<xsl:value-of select="$path/v3:value/@value"/>
			<xsl:value-of select="$path/v3:value/@unit"/>
		</td>
	</xsl:template>
	<!-- display the imprint characteristic symbol -->
	<xsl:template name="symbol">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Symbol</td>
		<td class="formItem">
			<xsl:value-of select="$path/v3:value/@value"/>
		</td>
	</xsl:template>
	<!-- display the imprint characteristic coating -->
	<xsl:template name="coating">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Coating</td>
		<td class="formItem">
			<xsl:value-of select="$path/v3:value/@value"/>
		</td>
	</xsl:template>	
	<xsl:template name="image">
		<xsl:param name="path" select="."/>
		<xsl:if test="string-length($path/v3:value/v3:reference/@value) > 0">
			<img alt="Image of Product" style="width:100%;" src="{$path/v3:value/v3:reference/@value}"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="contains">
		<xsl:param name="path" select="."/>
		<td class="formLabel">Contains</td>
		<td class="formItem">
			<xsl:for-each select="$path/v3:value">
				<xsl:if test="position() > 1">,&#160;</xsl:if>
				<xsl:value-of select="./@displayName"/>
				<xsl:if test="normalize-space(./v3:originalText)"> (<xsl:value-of select="./v3:originalText"/>) </xsl:if>
			</xsl:for-each>
			<xsl:if test="not($path/v3:value)">&#160;&#160;&#160;&#160;</xsl:if>
		</td>
	</xsl:template>
	<xsl:template name="partQuantity">
		<xsl:param name="path" select="."/>
		<table width="100%" cellpadding="3" cellspacing="0" class="formTablePetite">
			<tr>
				<td colspan="5" class="formHeadingTitle">Quantity of Parts</td>
			</tr>
			<tr>
				<td width="5" class="formTitle">Part&#160;#</td>
				<td class="formTitle">Package Quantity</td>
				<td class="formTitle">Total Product Quantity</td>
			</tr>
			<xsl:for-each select="$path/v3:part">
				<tr>
					<xsl:attribute name="class">
						<xsl:choose>
							<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
							<xsl:otherwise>formTableRowAlt</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
					<td width="5" class="formItem">
						<strong>Part <xsl:value-of select="position()"/></strong>
					</td>
					<td class="formItem">	
						<xsl:if test="*[self::v3:partProduct or self::v3:partMedicine]/v3:asContent/v3:quantity/v3:numerator/@value">
							<xsl:value-of select="round(v3:quantity/v3:numerator/@value div *[self::v3:partProduct or self::v3:partMedicine]/v3:asContent/v3:quantity/v3:numerator/@value)"/>
							<xsl:text> </xsl:text>
							<xsl:value-of select="*[self::v3:partProduct or self::partMedicine]/v3:asContent/*[self::v3:containerPackagedProduct or self::v3:containerPackagedMedicine]/v3:formCode/@displayName"/>
						</xsl:if>							
						<xsl:text> </xsl:text>
					</td>							
					<td class="formItem">
						<xsl:value-of select="v3:quantity/v3:numerator/@value"/>&#160;<xsl:if test="normalize-space(v3:quantity/v3:numerator/@unit)!='1'"><xsl:value-of select="v3:quantity/v3:numerator/@unit"/></xsl:if>
						<xsl:if test="(v3:quantity/v3:denominator/@value and normalize-space(v3:quantity/v3:denominator/@value)!='1') 
													or (v3:quantity/v3:denominator/@unit and normalize-space(v3:quantity/v3:denominator/@unit)!='1')"> &#160;in&#160;<xsl:value-of select="v3:quantity/v3:denominator/@value"
													/>&#160;<xsl:if test="normalize-space(v3:quantity/v3:denominator/@unit)!='1'"><xsl:value-of select="v3:quantity/v3:denominator/@unit"/>
						</xsl:if></xsl:if>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	<xsl:template name="packaging">
		<xsl:param name="path" select="."/>
		<table width="100%" cellpadding="3" cellspacing="0" class="formTablePetite">
			<tr>
				<td colspan="4" class="formHeadingTitle">Packaging</td>
			</tr>
			<tr>
				<td width="1" class="formTitle">#</td>
				<td class="formTitle">Item Code</td>
				<td class="formTitle">Package Description</td>
			</tr>
			<xsl:for-each select="$path/v3:asContent/descendant-or-self::v3:asContent[not(*/v3:asContent)]">
				<xsl:call-template name="packageInfo">
					<xsl:with-param name="path" select="."/>
					<xsl:with-param name="number" select="position()"/>
				</xsl:call-template>
			</xsl:for-each>
			<xsl:if test="not($path/v3:asContent)">
				<tr>
					<td colspan="4" class="formTitle">
						<strong>Package Information Not Applicable</strong>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>
	<xsl:template name="packageInfo">
		<xsl:param name="path"/>
		<xsl:param name="number" select="1"/>
		<xsl:for-each select="$path/ancestor-or-self::v3:asContent/*[self::v3:containerPackagedProduct or self::v3:containerPackagedMedicine]">
			<xsl:sort select="position()" order="descending"/>
			<xsl:variable name="current" select="."/>
			<tr>
				<xsl:attribute name="class">
					<xsl:choose>
						<xsl:when test="$number mod 2 = 0">formTableRow</xsl:when>
						<xsl:otherwise>formTableRowAlt</xsl:otherwise>
					</xsl:choose>
				</xsl:attribute>
				<td class="formItem">
					<strong>
						<xsl:value-of select="$number"/>
					</strong>
				</td>
				<td class="formItem">
					<xsl:for-each select="v3:code[1]/@code">
						<xsl:for-each select="$itemCodeSystems/label[@codeSystem = current()/../@codeSystem][approval/@code = current()/ancestor::*[self::v3:manufacturedProduct or self::v3:manufacturedMedicine or self::v3:partProduct or self::v3:partMedicine][1]/../v3:subjectOf/v3:approval/v3:code/@code or @drug = count(current()/ancestor::*[self::v3:manufacturedProduct or self::v3:manufacturedMedicine or self::v3:partProduct or self::v3:partMedicine][1]/v3:asEntityWithGeneric)][1]/@name">
							<xsl:value-of select="."/>
							<xsl:text>:</xsl:text>
						</xsl:for-each>
						<xsl:value-of select="."/>
					</xsl:for-each>
				</td>
				<td class="formItem">
					<xsl:for-each select="../v3:quantity/v3:numerator">
						<xsl:value-of select="@value"/>
						<xsl:text> </xsl:text>
						<xsl:if test="@unit[. != '1']">
							<xsl:value-of select="@unit"/>
						</xsl:if>
					</xsl:for-each>
					<xsl:text> in </xsl:text>
					<xsl:value-of select="../v3:quantity/v3:denominator/@value"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="v3:formCode/@displayName"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>


	<!-- MODE: ldd - lot distribution data -->
	<!-- Note: this is a model how to make these tables right, with apply-templates instead of all these call-template. -->
	<xsl:template mode="ldd" match="/|node()|@*">
		<xsl:apply-templates mode="ldd" select="@*|node()"/>
	</xsl:template>
	<!-- FILL LOT -->
	<xsl:template mode="ldd" match="v3:instanceOfKind[not(preceding-sibling::v3:instanceOfKind)]/v3:productInstance" priority="2">
		<tr>
			<td colspan="2" class="formHeadingTitle">Lot Distribution Data</td>
			<td class="formTitle">Reporting Period</td>
			<td class="formItem">
				<xsl:variable name="range" select="ancestor::v3:section[1]/v3:effectiveTime"/>	
				<xsl:value-of select="$range/v3:low/@value"/>	
				<xsl:text>-</xsl:text>
				<xsl:value-of select="$range/v3:high/@value"/>
			</td>
			<td colspan="5" class="formHeadingTitle"></td>
			<td class="formTitle">DUNS</td>
		</tr>
		<xsl:call-template name="next-match-fill-lot"/>
	</xsl:template>
	<xsl:template mode="ldd" match="v3:instanceOfKind/v3:productInstance" priority="1" name="next-match-fill-lot">
		<tr>
			<td class="formTitle">Fill Lot Number</td>
			<td class="formTitle">Bulk Lot Number</td>
			<td class="formTitle" colspan="5">Substance</td>
			<td class="formTitle">Quantity</td>
			<td class="formTitle">Unit</td>
			<td class="formTitle">DUNS</td>
		</tr>
		<tr>
			<td rowspan="{count(v3:ingredient)+1}" class="formItem"><xsl:value-of select="v3:id/@extension"/></td>
		</tr>
		<xsl:apply-templates mode="ldd" select="v3:ingredient"/>
		<xsl:apply-templates mode="ldd" select="*[not(self::v3:ingredient)]"/>
	</xsl:template>
	<!-- BULK LOT -->
	<xsl:template mode="ldd" name="bulk" match="v3:productInstance/v3:ingredient/v3:ingredientProductInstance" priority="1">
		<tr>
			<td class="formItem"><xsl:value-of select="v3:id/@extension"/></td>
			<td colspan="5" class="formItem"><xsl:value-of select="v3:asInstanceOfKind/v3:kindOfMaterialKind/v3:name"/></td>
			<td class="formItem"><xsl:value-of select="../v3:quantity/v3:numerator/@value"/></td>
			<td class="formItem"><xsl:value-of select="../v3:quantity/v3:numerator/@unit"/></td>
			<td class="formItem"><xsl:value-of select="../v3:subjectOf/v3:productEvent[v3:code[@code='C43360' and @codeSystem='2.16.840.1.113883.3.26.1.1']]/v3:performer/v3:assignedEntity/v3:representedOrganization/v3:id/@extension"/></td>
		</tr>
	</xsl:template>
	<!-- LABEL LOT -->
	<xsl:template mode="ldd" match="v3:productInstance/v3:member[not(preceding-sibling::v3:member)]/v3:memberProductInstance/v3:asContent/v3:container" priority="2">
		<tr>
			<td class="formTitle">Final Container Lot Number</td>
			<td class="formTitle">NDC Package Code</td>
			<td class="formTitle">Container Quantity (Doses)</td>
			<td class="formTitle">Container Form</td>
			<td class="formTitle">Distributed Containers (Doses)</td>
			<td class="formTitle">Distribution Type</td>
			<td class="formTitle">Initial Date</td>
			<td class="formTitle">Expiration Date</td>
			<td class="formTitle">Returned Containers (Doses)</td>
			<td class="formTitle">DUNS</td>
		</tr>
		<xsl:call-template name="next-match-label-lot"/>
	</xsl:template>
	<xsl:template mode="ldd" match="v3:productInstance/v3:member/v3:memberProductInstance/v3:asContent/v3:container" priority="1" name="next-match-label-lot">
		<tr>
			<td class="formItem"><xsl:value-of select="../../v3:id/@extension"/></td>
			<td class="formItem"><xsl:value-of select="v3:code/@code"/></td>
			<xsl:variable name="quantity" select="../v3:quantity/v3:numerator"/>
			<xsl:variable name="doseQuantity" select="ancestor::*[v3:consumedIn][1]/v3:consumedIn/v3:substanceAdministration1/v3:doseQuantity"/>
			<xsl:variable name="dosesPerContainer" select="number($quantity[@unit = $doseQuantity/@unit]/@value) div number($doseQuantity/@value[number(.) > 0])"/>
			<td class="formItem">
				<xsl:value-of select="$quantity/@value"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$quantity/@unit[not(. = '1')]"/>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="$dosesPerContainer"/> 
				<xsl:text>)</xsl:text>
			</td>
			<td class="formItem"><xsl:value-of select="v3:formCode/@displayName"/></td>
			<td class="formItem">
				<xsl:variable name="qty" select="../v3:subjectOf[v3:productEvent[v3:code[@code = 'C99998' or @code = 'C99997']]]/v3:quantity/@value"/>
				<xsl:value-of select="$qty"/>
				<xsl:text> (</xsl:text>
				<xsl:value-of select="number($qty) * $dosesPerContainer"/> 
				<xsl:text>)</xsl:text>
			</td>
			<td class="formItem"><xsl:value-of select="../v3:subjectOf/v3:productEvent[v3:code[@code = 'C99998' or @code = 'C99997']]/v3:code/@displayName"/></td>
			<td class="formItem"><xsl:value-of select="../v3:subjectOf/v3:productEvent[v3:code[@code = 'C99998' or @code = 'C99997']]/v3:effectiveTime/v3:low/@value"/></td>
			<td class="formItem"><xsl:value-of select="../../v3:expirationTime/v3:high/@value"/></td>
			<td class="formItem">
				<xsl:variable name="qty1" select="../v3:subjectOf[v3:productEvent[v3:code[@code = 'C99996']]]/v3:quantity/@value"/>
				<xsl:if test="$qty1">
					<xsl:value-of select="$qty1"/>
					<xsl:text> (</xsl:text>
					<xsl:value-of select="number($qty1) * $dosesPerContainer"/> 
					<xsl:text>)</xsl:text>
				</xsl:if>
			</td>
			<td class="formItem"><xsl:value-of select="../../../v3:subjectOf/v3:productEvent[v3:code[@code='C43360' and @codeSystem='2.16.840.1.113883.3.26.1.1']]/v3:performer/v3:assignedEntity/v3:representedOrganization/v3:id/@extension"/></td>
		</tr>
	</xsl:template>

	<xsl:template name="MarketingInfo">
		<xsl:if test="../v3:subjectOf/v3:approval|../v3:subjectOf/v3:marketingAct">
			<table width="100%" cellpadding="3" cellspacing="0" class="formTableMorePetite">
				<tr>
					<td colspan="4" class="formHeadingReg"><span class="formHeadingTitle" >Marketing Information</span></td>
				</tr>
				<tr>
					<td class="formTitle">Marketing Category</td>
					<td class="formTitle">Application Number or Monograph Citation</td>
					<td class="formTitle">Marketing Start Date</td>
					<td class="formTitle">Marketing End Date</td>
				</tr>
				<tr class="formTableRowAlt">
					<td class="formItem">
						<xsl:value-of select="../v3:subjectOf/v3:approval/v3:code/@displayName"/>
					</td>
					<td class="formItem">
						<xsl:value-of select="../v3:subjectOf/v3:approval/v3:id/@extension"/>
					</td>
					<td class="formItem">						
						<xsl:call-template name="string-to-date">
							<xsl:with-param name="text">
								<xsl:value-of select="../v3:subjectOf/v3:marketingAct/v3:effectiveTime/v3:low/@value"/>
							</xsl:with-param>
						</xsl:call-template>
					</td>
					<td class="formItem">					
						<xsl:call-template name="string-to-date">
							<xsl:with-param name="text">
								<xsl:value-of select="../v3:subjectOf/v3:marketingAct/v3:effectiveTime/v3:high/@value"/>
							</xsl:with-param>
						</xsl:call-template>
					</td>
				</tr>
			</table>
		</xsl:if>
	</xsl:template>	


	<xsl:template mode="subjects" match="//v3:author/v3:assignedEntity/v3:representedOrganization">	
		<xsl:if test="(count(./v3:name)>0)">
			<table width="100%" cellpadding="3" cellspacing="0" class="formTableMorePetite">
				<tr>
					<td colspan="4" class="formHeadingReg"><span class="formHeadingTitle" >Labeler -&#160;</span><xsl:value-of select="./v3:name"/> 
					<xsl:choose>
						<xsl:when test="./v3:id[@root='1.3.6.1.4.1.519.1']/@extension">
							(<xsl:value-of select="./v3:id[@root='1.3.6.1.4.1.519.1']/@extension"/>)
						</xsl:when>
						<xsl:when  test="./v3:assignedEntity/v3:assignedOrganization/v3:id[@root='1.3.6.1.4.1.519.1']/@extension">
							(<xsl:value-of select="./v3:assignedEntity/v3:assignedOrganization/v3:id[@root='1.3.6.1.4.1.519.1']/@extension"/>)
						</xsl:when>
						<xsl:otherwise/>
					</xsl:choose>
					<xsl:if test="/v3:document/v3:code/@code = '51726-8'">
						<span class="formHeadingTitle">NDC Labeler Code: </span>
						<xsl:choose>
							<xsl:when test="./v3:id[@root='2.16.840.1.113883.6.69']/@extension">
								<xsl:value-of select="./v3:id[@root='2.16.840.1.113883.6.69']/@extension"/>
							</xsl:when>						
							<xsl:when  test="./v3:assignedEntity/v3:assignedOrganization/v3:id[@root='2.16.840.1.113883.6.69']/@extension">
								<xsl:value-of select="./v3:assignedEntity/v3:assignedOrganization/v3:id[@root='2.16.840.1.113883.6.69']/@extension"/>
							</xsl:when>
							<xsl:otherwise/>
						</xsl:choose>
					</xsl:if>
					</td>
				</tr>
				<xsl:call-template name="data-contactParty"/>
			</table>
		</xsl:if>
	</xsl:template>	
	<xsl:template name="data-contactParty">
		<xsl:for-each select="v3:contactParty">
			<xsl:if test="position() = 1">
				<tr>
					<td class="formTitle">Contact</td>
					<td class="formTitle">Address</td>
					<td class="formTitle">Telephone Number</td>
					<td class="formTitle">Email Address</td>
				</tr>
			</xsl:if>
			<tr class="formTableRowAlt">
				<td class="formItem">
					<xsl:value-of select="v3:contactPerson/v3:name"/>
				</td>
				<td class="formItem">		
					<xsl:apply-templates mode="format" select="v3:addr"/>
				</td>
				<td class="formItem">
					<xsl:value-of select=" substring-after(v3:telecom/@value[starts-with(.,'tel:')][1], 'tel:')"/>
				</td>
				<td class="formItem">
					<xsl:value-of select=" substring-after(v3:telecom/@value[starts-with(.,'mailto:')][1], 'mailto:')"/>
				</td>
			</tr>
		</xsl:for-each>
	</xsl:template>
	
	<xsl:template mode="subjects" match="//v3:author/v3:assignedEntity/v3:representedOrganization/v3:assignedEntity/v3:assignedOrganization">	
		<xsl:if test="./v3:name">
			<table width="100%" cellpadding="3" cellspacing="0" class="formTableMorePetite">
				<tr>
					<td colspan="4" class="formHeadingReg"><span class="formHeadingTitle" >Registrant -&#160;</span><xsl:value-of select="./v3:name"/><xsl:if test="./v3:id/@extension"> (<xsl:value-of select="./v3:id/@extension"/>)</xsl:if></td>
				</tr>
				<xsl:call-template name="data-contactParty"/>
			</table>
		</xsl:if>
	</xsl:template>	
	
	<xsl:template mode="subjects" match="//v3:author/v3:assignedEntity/v3:representedOrganization/v3:assignedEntity/v3:assignedOrganization/v3:assignedEntity/v3:assignedOrganization">	
		<xsl:if test="./v3:name">
			<table width="100%" cellpadding="3" cellspacing="0" class="formTableMorePetite">
				<tr>
					<td colspan="4" class="formHeadingReg">
						<span class="formHeadingTitle" >
							<xsl:choose>
								<xsl:when test="/v3:document/v3:code[@code = '72090-4' or @code = '71743-9']">Facility</xsl:when>
								<xsl:otherwise>Establishment</xsl:otherwise>
							</xsl:choose>
						</span>
					</td>				
				</tr>
				<tr>
					<td class="formTitle">Name</td>
					<td class="formTitle">Address</td>
					<td class="formTitle">ID/FEI</td>
					<td class="formTitle">Business Operations</td>
				</tr>
				<tr class="formTableRowAlt">
					<td class="formItem">
						<xsl:value-of select="./v3:name"/>
					</td>
					<td class="formItem">	
						<xsl:apply-templates mode="format" select="./v3:addr"/>	
					</td>
					<!-- root = "1.3.6.1.4.1.519.1" -->
					<td class="formItem">
						<xsl:value-of select="./v3:id[@root='1.3.6.1.4.1.519.1']/@extension"/><xsl:if test="./v3:id[@root='1.3.6.1.4.1.519.1']/@extension and ./v3:id[not(@root='1.3.6.1.4.1.519.1')]/@extension">/</xsl:if><xsl:value-of select="./v3:id[not(@root='1.3.6.1.4.1.519.1')]/@extension"/>
					</td>
					<td class="formItem">
						<xsl:for-each select="../v3:performance[not(v3:actDefinition/v3:code/@code = preceding-sibling::*/v3:actDefinition/v3:code/@code)]/v3:actDefinition/v3:code">
							<xsl:variable name="code" select="@code"/>
							<xsl:value-of select="@displayName"/>
							<xsl:variable name="itemCodes" select="../../../v3:performance/v3:actDefinition[v3:code/@code = $code]/v3:product/v3:manufacturedProduct/v3:manufacturedMaterialKind/v3:code/@code"/>
							<xsl:if test="$itemCodes">
								<xsl:text>(</xsl:text>
								<xsl:for-each select="$itemCodes">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">, </xsl:if>
								</xsl:for-each>
								<xsl:text>)</xsl:text>
							</xsl:if>
							<xsl:if test="../../../v3:performance/v3:actDefinition[v3:code/@code = $code][v3:subjectOf/v3:approval[v3:code[@code = 'C101886']]]">
								<xsl:text> (manufactures non-generics)</xsl:text>
							</xsl:if>
							<xsl:if test="position()!=last()">, </xsl:if>
						</xsl:for-each>
					</td>
				</tr>
				<xsl:call-template name="data-contactParty"/>
				<xsl:for-each select="./v3:assignedEntity[v3:performance/v3:actDefinition/v3:code/@code='C73330']/v3:assignedOrganization">
					<xsl:if test="position() = 1">
						<tr>
							<td class="formTitle">US Agent (ID)</td>
							<td class="formTitle">Address</td>
							<td class="formTitle">Telephone Number</td>
							<td class="formTitle">Email Address</td>
						</tr>
					</xsl:if>
					<tr class="formTableRowAlt">
						<td class="formItem">
							<xsl:value-of select="v3:name"/>
							<xsl:for-each select="v3:id/@extension">
								<xsl:text> (</xsl:text>
								<xsl:value-of select="."/>
								<xsl:text>)</xsl:text>
							</xsl:for-each>
						</td>
						<td class="formItem">		
							<xsl:apply-templates mode="format" select="v3:addr"/>
						</td>
						<td class="formItem">
							<xsl:value-of select=" substring-after(v3:telecom/@value[starts-with(.,'tel:')][1], 'tel:')"/>
						</td>
						<td class="formItem">
							<xsl:value-of select=" substring-after(v3:telecom/@value[starts-with(.,'mailto:')][1], 'mailto:')"/>
						</td>
					</tr>
				</xsl:for-each>
				<!-- 53617 changed to 73599 -->
				<xsl:for-each select="./v3:assignedEntity[v3:performance/v3:actDefinition/v3:code/@code='C73599']/v3:assignedOrganization">	
					<xsl:if test="position() = 1">
						<tr>
							<td class="formTitle">Importer (ID)</td>
							<td class="formTitle">Address</td>
							<td class="formTitle">Telephone Number</td>
							<td class="formTitle">Email Address</td>
						</tr>
					</xsl:if>
					<tr class="formTableRowAlt">
						<td class="formItem">
							<xsl:value-of select="v3:name"/>
							<xsl:for-each select="v3:id/@extension">
								<xsl:text> (</xsl:text>
								<xsl:value-of select="."/>
								<xsl:text>)</xsl:text>
							</xsl:for-each>
						</td>
						<td class="formItem">		
							<xsl:apply-templates mode="format" select="v3:addr"/>
						</td>
						<td class="formItem">
							<xsl:value-of select=" substring-after(v3:telecom/@value[starts-with(.,'tel:')][1], 'tel:')"/>
						</td>
						<td class="formItem">
							<xsl:value-of select=" substring-after(v3:telecom/@value[starts-with(.,'mailto:')][1], 'mailto:')"/>
						</td>
					</tr>
				</xsl:for-each>
			</table>
		</xsl:if>
	</xsl:template>	
	
	
	<!-- Start PLR Information templates
			 1. product code
			 2. dosage form
			 3. route of administration
			 4. ingredients
			 5. imprint information
			 6. packaging information
	-->
	<xsl:template name="PLRIndications" mode="indication" match="v3:section [v3:code [descendant-or-self::* [(self::v3:code or self::v3:translation) and @codeSystem='2.16.840.1.113883.6.1' and @code='34067-9'] ] ]">
		<xsl:if test="count(//v3:reason) > 0">
			<table class="contentTablePetite" cellSpacing="0" cellPadding="3" width="100%">
				<tbody>
					<tr>
						<td class="contentTableTitle">Indications and Usage</td>
					</tr>
					<tr>
						<td>
							<table class="formTablePetite" cellSpacing="0" cellPadding="3" width="100%">
								<tbody>
									<tr>
										<td class="formTitle" colSpan="2">INDICATIONS</td>
										<td class="formTitle" colSpan="4">USAGE</td>
									</tr>
									<tr>
										<td class="formTitle">Indication</td>
										<td class="formTitle">Intent&#160;Of Use</td>
										<td class="formTitle">Maximum Dose</td>
										<td class="formTitle" colSpan="4">Conditions &amp; Limitations Of Use</td>
									</tr>
									<!-- Repeat Me -->
									<xsl:for-each select="$indicationSection//v3:excerpt/v3:highlight/v3:subject">
										<tr class="formTableRowAlt">
											<td class="formItem" valign="top">
												<strong><xsl:value-of select="./v3:substanceAdministration/v3:reason/v3:indicationObservationCriterion/v3:value/@displayName"/> (<xsl:value-of
												select="./v3:substanceAdministration/v3:reason/v3:indicationObservationCriterion/v3:code/@displayName"/>)</strong>
											</td>
											<td class="formItem" valign="top">
												<xsl:value-of select="./v3:substanceAdministration/v3:reason/@typeCode"/>
											</td>
											<td class="formItem" valign="top">
												<xsl:choose>
													<xsl:when test="./v3:substanceAdministration/v3:maxDoseQuantity">
														<xsl:value-of select="./v3:substanceAdministration/v3:maxDoseQuantity/v3:numerator/@value"/>&#160; <xsl:value-of
														select="./v3:substanceAdministration/v3:maxDoseQuantity/v3:numerator/@unit"/>&#160;per&#160; <xsl:value-of
														select="./v3:substanceAdministration/v3:maxDoseQuantity/v3:denominator/@value"/>&#160; <xsl:value-of
														select="./v3:substanceAdministration/v3:maxDoseQuantity/v3:denominator/@unit"/>
													</xsl:when>
													<xsl:otherwise>
														<xsl:for-each select="//v3:maxDoseQuantity[ancestor::v3:section/v3:code/@code = $dosageAndAdministrationSectionCode]">
															<xsl:value-of select="./v3:numerator/@value"/>&#160; <xsl:value-of select="./v3:numerator/@unit"/>&#160;per&#160; <xsl:value-of
															select="./v3:denominator/@value"/>&#160; <xsl:value-of select="./v3:denominator/@unit"/>
														</xsl:for-each>
													</xsl:otherwise>
												</xsl:choose>
											</td>
											<td class="formItem" colSpan="3">
												<table class="formTablePetite" cellSpacing="0" cellPadding="5" width="100%">
													<tbody>
														<tr class="formTable">
															<td class="formTitle" colSpan="4">Conditions Of Use</td>
														</tr>
														<tr class="formTable">
															<td class="formTitle">Use Category</td>
															<td class="formTitle">Precondition Category</td>
															<td class="formTitle">Precondition</td>
															<td class="formTitle">Labeling Section</td>
														</tr>
														<!-- Repeat Each precondition for the indication subject -->
														<!-- PCR 593 Displaying all the preconditions that are specifict to this indication and those that may be in other sections such
																 as the Dosage forms and Strengths.
														-->
														<!-- PCR 593 Displaying all the preconditions that are specifict to this indication and those that may be in other sections such
																 as the Dosage forms and Strengths.
														-->
														<!-- PCR 606 In order to remove the duplicates each section whose ancestor is anything other than $indicationSectionCode.
																 A not (!) in the predicate will not do since a precondition axis can have multiple section tags as ancestors, of which any may be an Indication Section.
														-->
														<xsl:for-each select="./v3:substanceAdministration/v3:precondition">
															<xsl:call-template name="displayConditionsOfUse"> </xsl:call-template>
														</xsl:for-each>
														<xsl:for-each select="//v3:excerpt/v3:highlight/v3:subject/v3:substanceAdministration/v3:precondition">
															<xsl:if test="count(ancestor::v3:section[v3:code/@code=$indicationSectionCode]) = 0">
																<xsl:call-template name="displayConditionsOfUse"> </xsl:call-template>
															</xsl:if>
														</xsl:for-each>
														<xsl:for-each select="./v3:substanceAdministration/v3:componentOf">
															<tr>
																<xsl:attribute name="class">
																	<xsl:choose>
																		<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
																		<xsl:otherwise>formTableRowAlt</xsl:otherwise>
																	</xsl:choose>
																</xsl:attribute>
																<td class="formItem">Condition of use</td>
																<td class="formItem">Screening/monitoring test</td>
																<td class="formItem">
																	<xsl:for-each select="./v3:protocol/v3:component">
																		<xsl:value-of select="./v3:monitoringObservation/v3:code/@displayName"/>
																		<xsl:call-template name="printSeperator">
																			<xsl:with-param name="currentPos" select="position()"/>
																			<xsl:with-param name="lastPos" select="last()"/>
																			<xsl:with-param name="lastDelimiter">&#160;and</xsl:with-param>
																		</xsl:call-template>
																	</xsl:for-each>
																</td>
																<td class="formItem">
																	<xsl:variable name="sectionNumberSequence">
																		<xsl:apply-templates mode="sectionNumber" select="$indicationSection/ancestor-or-self::v3:section"/>
																	</xsl:variable>
																	<a href="#section-{substring($sectionNumberSequence,2)}">
																		<xsl:value-of select="$indicationSection/v3:title"/>
																	</a>
																</td>
															</tr>
														</xsl:for-each>
														<!-- end repeat -->
														<tr>
															<td>&#160;</td>
														</tr>
														<tr class="formTable">
															<td class="formTitle" colSpan="4">Limitations Of Use</td>
														</tr>
														<tr class="formTable">
															<td class="formTitle">Use Category</td>
															<td class="formTitle">Precondition Category</td>
															<td class="formTitle">Precondition</td>
															<td class="formTitle">Labeling Section</td>
														</tr>
														<!-- Repeat Each Limitation of Use -->
														<!-- apply all limitation of use templates for issues within this subject -->
														<!-- now apply all limitation of use templates for issues that are NOT within any indication section or subsection -->
														<!-- PCR 593 Since the limitation of use can have multiple ancestors called section, we process all children limitations of the current context.
																 and then all other limitations with specified named ancestors. All possible ancestors other than indication section are used in the predicate.  
																 Also made a call to a named template in a loop rather than a matched template-->
														<xsl:for-each select="./v3:substanceAdministration/v3:subjectOf/v3:issue">
															<xsl:call-template name="displayLimitationsOfUse"> </xsl:call-template>
														</xsl:for-each>
														<xsl:for-each select="//v3:excerpt/v3:highlight/v3:subject/v3:substanceAdministration/v3:subjectOf/v3:issue[v3:subject/v3:observationCriterion]">
															<xsl:if test="count(ancestor::v3:section[v3:code/@code=$indicationSectionCode]) = 0">
																<xsl:call-template name="displayLimitationsOfUse"> </xsl:call-template>
															</xsl:if>
														</xsl:for-each>
														<!-- end repeat -->
													</tbody>
												</table>
											</td>
										</tr>
									</xsl:for-each>
									<!--/xsl:for-each-->
									<!-- end repeat -->
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<xsl:template mode="indication" match="v3:value[@xsi:type='IVL_PQ']">
		<xsl:choose>
			<xsl:when test="v3:low and v3:high">
				<xsl:value-of select="v3:low/@value"/><xsl:value-of select="v3:low/@unit"/>&#160;to&#160;<xsl:value-of select="v3:high/@value"/><xsl:value-of select="v3:high/@unit"/>
			</xsl:when>
			<xsl:when test="v3:low and not(v3:high)"> &#8805; <xsl:value-of select="v3:low/@value"/><xsl:value-of select="v3:low/@unit"/>
			</xsl:when>
			<xsl:when test="not(v3:low) and v3:high"> &#8804;<xsl:value-of select="v3:high/@value"/><xsl:value-of select="v3:high/@unit"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template mode="indication" match="v3:value[@xsi:type='CE']">
		<xsl:param name="currentNode" select="."/>
		<xsl:value-of select="@displayName"/>
	</xsl:template>
	<xsl:template name="displayConditionsOfUse">
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
					<xsl:otherwise>formTableRowAlt</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:choose>
				<xsl:when test="./v3:observationCriterion">
					<td class="formItem">Condition of use</td>
					<td class="formItem">
						<xsl:value-of select="./v3:observationCriterion/v3:code/@displayName"/>
					</td>
					<td class="formItem">
						<xsl:apply-templates mode="indication" select="./v3:observationCriterion/v3:value"/>
					</td>
				</xsl:when>
				<xsl:when test="./v3:substanceAdministrationCriterion">
					<td class="formItem">Condition of use</td>
					<td class="formItem">Adjunct</td>
					<td class="formItem">
						<xsl:value-of select="./v3:substanceAdministrationCriterion/v3:consumable/v3:administrableMaterial/v3:administrableMaterialKind/v3:code/@displayName"/>
					</td>
				</xsl:when>
			</xsl:choose>
			<td class="formItem">
				<!--PCR 593 Instead of using the variable $indicationSection the section number is being uniquely determined. for conditionsl of use.
				-->
				<xsl:variable name="sectionNumberSequence">
					<xsl:apply-templates mode="sectionNumber" select="ancestor::v3:section[parent::v3:component[parent::v3:structuredBody]]"/>
				</xsl:variable>
				<a href="#section-{substring($sectionNumberSequence,2)}">
					<xsl:value-of select="ancestor::v3:section[parent::v3:component[parent::v3:structuredBody]]/v3:title/text()"/>
				</a>
			</td>
		</tr>
	</xsl:template>
	<!-- PCR593 Using a named template instead of a matched template for  v3:issue[v3:subject/v3:observationCriterion] See where it is
			 being called from, for more details.-->
	<xsl:template name="displayLimitationsOfUse">
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
					<xsl:otherwise>formTableRowAlt</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<td class="formItem">
				<xsl:value-of select="./v3:code/@displayName"/>
			</td>
			<td class="formItem">
				<xsl:for-each select="./v3:subject">
					<xsl:value-of select="./v3:observationCriterion/v3:code/@displayName"/>
					<xsl:call-template name="printSeperator">
						<xsl:with-param name="currentPos" select="position()"/>
						<xsl:with-param name="lastPos" select="last()"/>
						<xsl:with-param name="lastDelimiter">,</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</td>
			<td class="formItem">
				<xsl:for-each select="./v3:subject">
					<xsl:apply-templates mode="indication" select="./v3:observationCriterion/v3:value"/>
					<xsl:call-template name="printSeperator">
						<xsl:with-param name="currentPos" select="position()"/>
						<xsl:with-param name="lastPos" select="last()"/>
						<xsl:with-param name="lastDelimiter">&#160;and</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</td>
			<td class="formItem">
				<xsl:variable name="sectionNumberSequence">
					<xsl:apply-templates mode="sectionNumber" select="ancestor::v3:section[parent::v3:component[parent::v3:structuredBody]]"/>
				</xsl:variable>
				<a href="#section-{substring($sectionNumberSequence,2)}">
					<xsl:value-of select="ancestor::v3:section[parent::v3:component[parent::v3:structuredBody]]/v3:title/text()"/>
				</a>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="PLRInteractions">
		<xsl:if test="count(//v3:issue[v3:subject[v3:substanceAdministrationCriterion]]) > 0 or count(//v3:issue[not(v3:subject) and v3:risk]) > 0">
			<table class="contentTablePetite" cellSpacing="0" cellPadding="3" width="100%">
				<tbody>
					<tr>
						<td class="contentTableTitle">Interactions and Adverse Reactions</td>
					</tr>
					<tr class="formTableRowAlt">
						<td class="formItem">
							<table class="formTablePetite" cellSpacing="0" cellPadding="3" width="100%">
								<tbody>
									<tr>
										<td class="formTitle" colSpan="4">INTERACTIONS</td>
									</tr>
									<tr>
										<td class="formTitle">Contributing Factor</td>
										<td class="formTitle">Type of Consequence</td>
										<td class="formTitle">Consequence</td>
										<td class="formTitle">Labeling Section</td>
									</tr>
									<!-- only select those issues that have the proper interactions code of 'C54708' -->
									<!-- all others will be placed in a table with a title "UN-CODED INTERACTIONS OR ADVERSE REACTIONS" -->
									<xsl:apply-templates mode="interactions" select="//v3:issue[v3:code/@code = 'C54708']"/>
								</tbody>
							</table>
						</td>
					</tr>
					<tr class="formTableRowAlt">
						<td class="formItem">
							<table class="formTablePetite" cellSpacing="0" cellPadding="3" width="100%">
								<tbody>
									<tr>
										<td class="formTitle" colSpan="4">ADVERSE REACTIONS</td>
									</tr>
									<tr>
										<td class="formTitle">Type of Consequence</td>
										<td class="formTitle">Consequence</td>
										<td class="formTitle">Labeling Section</td>
									</tr>
									<!-- only select those issues that have the proper adverse reactions code of 'C41332' -->
									<!-- all others will be placed in a table with a title "UN-CODED INTERACTIONS OR ADVERSE REACTIONS" -->
									<xsl:apply-templates mode="adverseReactions" select="//v3:issue[v3:code/@code = 'C41332']"/>
								</tbody>
							</table>
						</td>
					</tr>
					<xsl:if
							test="(//v3:issue[v3:subject[v3:substanceAdministrationCriterion] and v3:code/@code != 'C54708']) or (//v3:issue[not(./v3:subject) and v3:risk and v3:code/@code != 'C41332'])">
						<tr class="formTableRowAlt">
							<td class="formItem">
								<table class="formTablePetite" cellSpacing="0" cellPadding="3" width="100%">
									<tbody>
										<tr>
											<td class="formTitle" colSpan="4">UN-CODED INTERACTIONS OR ADVERSE REACTIONS</td>
										</tr>
										<tr>
											<td class="formTitle">Contributing Factor</td>
											<td class="formTitle">Type of Consequence</td>
											<td class="formTitle">Consequence</td>
											<td class="formTitle">Labeling Section</td>
										</tr>
										<!-- apply the interaction sections that are improperly coded -->
										<xsl:apply-templates mode="interactions" select="//v3:issue[v3:subject[v3:substanceAdministrationCriterion] and v3:code/@code != 'C54708']"/>
										<!-- apply the adverse reaction sections that are imprperly code -->
										<xsl:apply-templates mode="adverseReactions" select="//v3:issue[not(./v3:subject) and v3:risk and v3:code/@code != 'C41332']">
											<xsl:with-param name="addEmptyTd">true</xsl:with-param>
										</xsl:apply-templates>
									</tbody>
								</table>
							</td>
						</tr>
					</xsl:if>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
	<!-- Interactions template -->
	<xsl:template mode="interactions" match="v3:issue[v3:subject[v3:substanceAdministrationCriterion]]">
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
					<xsl:otherwise>formTableRowAlt</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<td class="formItem">
				<xsl:for-each select="v3:subject">
					<xsl:value-of select="./v3:substanceAdministrationCriterion/v3:consumable/v3:administrableMaterial/v3:playingMaterialKind/v3:code/@displayName"/>
					<xsl:call-template name="printSeperator">
						<xsl:with-param name="currentPos" select="position()"/>
						<xsl:with-param name="lastPos" select="last()"/>
						<xsl:with-param name="lastDelimiter">&#160;and</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</td>
			<td class="formItem">
				<xsl:for-each select="v3:risk">
					<xsl:value-of select="v3:consequenceObservation/v3:code/@displayName"/>
					<xsl:call-template name="printSeperator">
						<xsl:with-param name="currentPos" select="position()"/>
						<xsl:with-param name="lastPos" select="last()"/>
						<xsl:with-param name="lastDelimiter">,</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</td>
			<td class="formItem">
				<xsl:for-each select="v3:risk">
					<xsl:value-of select="v3:consequenceObservation/v3:value/@displayName"/>
					<xsl:call-template name="printSeperator">
						<xsl:with-param name="currentPos" select="position()"/>
						<xsl:with-param name="lastPos" select="last()"/>
						<xsl:with-param name="lastDelimiter">&#160;and</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</td>
			<td class="formItem">
				<xsl:variable name="sectionNumberSequence">
					<xsl:apply-templates mode="sectionNumber" select="ancestor::v3:section[parent::v3:component[parent::v3:structuredBody]]"/>
				</xsl:variable>
				<a href="#section-{substring($sectionNumberSequence,2)}">
					<xsl:value-of select="ancestor::v3:section[parent::v3:component[parent::v3:structuredBody]]/v3:title"/>
				</a>
			</td>
		</tr>
	</xsl:template>
	<!-- Adverse Reactions template -->
	<xsl:template mode="adverseReactions" match="v3:issue[not(./v3:subject) and v3:risk]">
		<xsl:param name="addEmptyTd">false</xsl:param>
		<tr>
			<xsl:attribute name="class">
				<xsl:choose>
					<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
					<xsl:otherwise>formTableRowAlt</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			<xsl:if test="$addEmptyTd = 'true'">
				<td>&#160;</td>
			</xsl:if>
			<td class="formItem">
				<xsl:for-each select="v3:risk">
					<xsl:value-of select="./v3:consequenceObservation/v3:code/@displayName"/>
					<xsl:call-template name="printSeperator">
						<xsl:with-param name="currentPos" select="position()"/>
						<xsl:with-param name="lastPos" select="last()"/>
						<xsl:with-param name="lastDelimiter">,</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</td>
			<td class="formItem">
				<xsl:for-each select="v3:risk">
					<xsl:value-of select="v3:consequenceObservation/v3:value/@displayName"/>
					<xsl:call-template name="printSeperator">
						<xsl:with-param name="currentPos" select="position()"/>
						<xsl:with-param name="lastPos" select="last()"/>
						<xsl:with-param name="lastDelimiter">&#160;and</xsl:with-param>
					</xsl:call-template>
				</xsl:for-each>
			</td>
			<td class="formItem">
				<xsl:variable name="sectionNumberSequence">
					<xsl:apply-templates mode="sectionNumber" select="ancestor::v3:section[parent::v3:component[parent::v3:structuredBody]]"/>
				</xsl:variable>
				<a href="#section-{substring($sectionNumberSequence,2)}">
					<xsl:value-of select="ancestor::v3:section[parent::v3:component[parent::v3:structuredBody]]/v3:title"/>
				</a>
			</td>
		</tr>
	</xsl:template>
	<xsl:template name="PharmacologicalClass">
		<xsl:if test="//v3:asSpecializedKind[v3:code/@codeSystem='2.16.840.1.113883.3.26.1.5']">
			<table cellSpacing="0" cellPadding="3" width="100%" class="formTablePetite">
				<tbody>
					<tr>
						<td class="formHeadingTitle">Pharmacologic Class</td>
					</tr>
					<tr class="formTableRowAlt">
						<td class="formItem">
							<table class="formTablePetite" cellSpacing="0" cellPadding="3" width="100%">
								<tbody>
									<tr>
										<td class="formHeadingTitle" width="30%">Substance</td>
										<td class="formHeadingTitle" width="70%">Pharmacologic Class</td>
									</tr>
									<xsl:for-each select="//*[v3:asSpecializedKind]">
										<tr>
											<xsl:attribute name="class">
												<xsl:choose>
													<xsl:when test="position() mod 2 = 0">formTableRow</xsl:when>
													<xsl:otherwise>formTableRowAlt</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
											<td class="formItem">
												<strong>
													<xsl:value-of select="v3:name"/>
												</strong>
											</td>
											<td class="formItem">
												<xsl:for-each select="v3:asSpecializedKind">
													<xsl:value-of select="v3:generalizedMaterialKind/v3:code/@displayName"/>
													<xsl:if test="contains(v3:generalizedMaterialKind/v3:code/@displayName,'[EPC]')">
													  <xsl:value-of select="concat('(', v3:generalizedMaterialKind/v3:name[@use='L'], ')')"/>
													</xsl:if>
													<xsl:call-template name="printSeperator">
														<xsl:with-param name="currentPos" select="position()"/>
														<xsl:with-param name="lastPos" select="last()"/>
														<xsl:with-param name="lastDelimiter">, and</xsl:with-param>
													</xsl:call-template>
												</xsl:for-each>
											</td>
										</tr>
									</xsl:for-each>
								</tbody>
							</table>
						</td>
					</tr>
				</tbody>
			</table>
		</xsl:if>
	</xsl:template>
</xsl:transform>
