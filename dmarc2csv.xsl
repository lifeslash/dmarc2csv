<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.1">
    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="delim" select="','" />
    <xsl:param name="quote" select="'&quot;'" />
    <xsl:param name="break" select="'&#xA;'" />

    <xsl:template match="/">
        <xsl:apply-templates select="feedback/record" />
    </xsl:template>

    <xsl:template match="record">
        <!-- 共通出力内容を取得 -->
        <xsl:variable name="org_name" select="../report_metadata/org_name" />
        <xsl:variable name="email" select="../report_metadata/email" />
        <xsl:variable name="extra_contact_info" select="../report_metadata/extra_contact_info" />
        <xsl:variable name="report_id" select="../report_metadata/report_id" />
        <xsl:variable name="begin" select="../report_metadata/date_range/begin" />
        <xsl:variable name="end" select="../report_metadata/date_range/end" />

        <xsl:variable name="domain" select="../policy_published/domain" />
        <xsl:variable name="adkim" select="../policy_published/adkim" />
        <xsl:variable name="aspf" select="../policy_published/aspf" />
        <xsl:variable name="p" select="../policy_published/p" />
        <xsl:variable name="sp" select="../policy_published/sp" />
        <xsl:variable name="pct" select="../policy_published/pct" />

        <xsl:variable name="source_ip" select="row/source_ip" />
        <xsl:variable name="count" select="row/count" />
        <xsl:variable name="disposition" select="row/policy_evaluated/disposition" />
        <xsl:variable name="dkim" select="row/policy_evaluated/dkim" />
        <xsl:variable name="spf" select="row/policy_evaluated/spf" />

        <xsl:variable name="header_from" select="identifier/header_from" />

        <xsl:variable name="dkim_domain" select="auth_results/dkim/domain" />
        <xsl:variable name="dkim_selector" select="auth_results/dkim/selector" />
        <xsl:variable name="dkim_result" select="auth_results/dkim/result" />

        <xsl:variable name="spf_domain" select="auth_results/spf/domain" />
        <xsl:variable name="spf_result" select="auth_results/spf/result" />

        <!-- 取得内容を出力 -->
        <xsl:value-of select="concat($quote, $org_name, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $email, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $extra_contact_info, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $report_id, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $begin, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $end, $quote, $delim)" />

        <xsl:value-of select="concat($quote, $domain, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $adkim, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $aspf, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $p, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $sp, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $pct, $quote, $delim)" />

        <xsl:value-of select="concat($quote, $source_ip, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $count, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $disposition, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $dkim, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $spf, $quote, $delim)" />

        <xsl:value-of select="concat($quote, $header_from, $quote, $delim)" />

        <xsl:value-of select="concat($quote, $dkim_domain, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $dkim_selector, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $dkim_result, $quote, $delim)" />

        <xsl:value-of select="concat($quote, $spf_domain, $quote, $delim)" />
        <xsl:value-of select="concat($quote, $spf_result, $quote, $break)" />
    </xsl:template>
</xsl:stylesheet>