<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
	version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:envelope_0_11="http://agavi.org/agavi/1.0/config"
	xmlns:factories_1_0="http://agavi.org/agavi/config/item/factories/1.0"
>
	<!--xmlns:factories_1_1="http://agavi.org/agavi/1.1/config/factories"-->
	
	<xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes" />
	
	<xsl:include href="_common.xsl" />
	
	<xsl:variable name="factories_1_0" select="'http://agavi.org/agavi/config/item/factories/1.0'" />
	<!--<xsl:variable name="factories11" select="'http://agavi.org/agavi/1.1/config/factories'" />-->
	
	<!-- pre-1.0 backwards compatibility for 1.0 -->
	<!-- non-"envelope" elements are copied to the 1.0 factories namespace -->
	<xsl:template match="envelope_0_11:*">
		<xsl:element name="{local-name()}" namespace="{$factories_1_0}">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	
	<!-- 1.0 BC for 1.1 -->
	<!-- namespace is simply changed to 1.1 for all elements except <storage> -->
	<!-- <xsl:template match="factories10:*">
		<xsl:element name="{local-name()}" namespace="{$factories11}">
			<xsl:copy-of select="@*" />
			<xsl:apply-templates />
		</xsl:element>
	</xsl:template>
	<xsl:template match="agavi10:storage | factories10:storage">
		<factories11:storage_manager class="AgaviStorageManager">
			<xsl:apply-templates />
		</factories11:storage_manager>
	</xsl:template> -->
	
</xsl:stylesheet>