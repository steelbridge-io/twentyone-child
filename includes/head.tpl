<!-- Styling -->
{*<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">*}
{*<link href="{assetPath file='all.min.css'}?v={$versionHash}" rel="stylesheet">*}
{*<link href="{assetPath file='theme.min.css'}?v={$versionHash}" rel="stylesheet">*}
{*<link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">*}
{*<link href="https://assets.calendly.com/assets/external/widget.css" rel="stylesheet">*}
<style>
	@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap");
	@import url("/templates/twenty-one/css/all.min.css");
	@import url("/templates/twenty-one/css/theme.min.css");
	@import url("{$WEB_ROOT}/assets/css/fontawesome-all.min.css");
	@import url("https://assets.calendly.com/assets/external/widget.css");
</style>
{assetExists file="supports.css"}
    {*<link href="{$__assetPath__}" rel="stylesheet">*}
	<style>
	@import url("{$__assetPath__}");
	</style>
{/assetExists}

<script>
	var csrfToken = '{$token}',
		markdownGuide = '{lang key="markdown.title"}',
		locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
		saved = '{lang key="markdown.saved"}',
		saving = '{lang key="markdown.saving"}',
		whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
		requiredText = '{lang key="orderForm.required"}',
		recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>
<script async src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>

{if $templatefile == "viewticket" && !$loggedin}
    <meta name="robots" content="noindex" />
{/if}
