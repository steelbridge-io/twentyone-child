<!doctype html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name=”robots” content="index, follow">
    <!--<title>{* {if $kbarticle.title}{$kbarticle.title } - {/if}{$pagetitle} - {$companyname}*}</title>-->
    {if ($gid)}
        <title>{if $LANG.pagetitle.configureproductdomain}{$LANG.pagetitle.configureproductdomain.$gid}{elseif $kbarticle.title}{$kbarticle.title} - {$pagetitle} - {$companyname}{/if}</title>
        <meta name="description" content="{$LANG.metadescription.configureproductdomain.$gid}" />
    {/if}
    {if ($templatefile eq 'homepage')}
        <title>{if $kbarticle.title}{$kbarticle.title} - {$pagetitle} - {$companyname}{elseif $LANG.pagetitle.homepage}{$LANG.pagetitle.homepage}{/if}</title>
        <meta name="description" content="{$LANG.metadescription.homepage}" />
    {/if}
    <script src="https://kit.fontawesome.com/76342ff491.js" crossorigin="anonymous"></script>
    {include file="$template/includes/head.tpl"}
    {$headoutput}

    {literal}
        <!-- Facebook Pixel Code -->

        <script>!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,document,'script','https://connect.facebook.net/en_US/fbevents.js'); fbq('init', '5782200988562938'); fbq('track', 'PageView');</script><noscript> <img height="1" width="1" src="https://www.facebook.com/tr?id=5782200988562938&ev=PageView&noscript=1"/></noscript>

        <!-- End Facebook Pixel Code -->

    {/literal}
</head>
<body class="primary-bg-color" data-phone-cc-input="{$phoneNumberInputStyle}">
<!-- Start of parsonshosting Zendesk Widget script -->
<!--<script id="ze-snippet" src="https://static.zdassets.com/ekr/snippet.js?key=465149fd-880a-4ebc-97a6-ff9b5f533866"> </script>-->

<!-- Calendly badge widget begin -->
<link href="https://assets.calendly.com/assets/external/widget.css" rel="stylesheet">
<script src="https://assets.calendly.com/assets/external/widget.js" type="text/javascript" async></script>
<script type="text/javascript">window.onload = function() { Calendly.initBadgeWidget({ url: 'https://calendly.com/d/d7g-sqd-ffc?primary_color=1a1a1a', text: 'Find Out How To Reach Us Today!', color: '#1a1a1a', textColor: '#ffffff', branding: true }); }</script>
<!-- Calendly badge widget end -->

{$headeroutput}

<header id="header" class="header">
    {if $loggedin}
        <div class="topbar">
            <div class="container">
                <div class="d-flex">
                    <div class="mr-auto">
                        <button type="button" class="btn" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                            <i class="far fa-flag"></i>
                            {if count($clientAlerts) > 0}
                                {count($clientAlerts)}
                                <span class="d-none d-sm-inline">Notifications</span>
                            {else}
                                <span class="d-sm-none">0</span>
                                <span class="d-none d-sm-inline">{lang key='nonotifications'}</span>
                            {/if}
                        </button>
                        <div id="accountNotificationsContent" class="w-hidden">
                            <ul class="client-alerts">
                                {foreach $clientAlerts as $alert}
                                    <li>
                                        <a href="{$alert->getLink()}">
                                            <i class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                            <div class="message">{$alert->getMessage()}</div>
                                        </a>
                                    </li>
                                    {foreachelse}
                                    <li class="none">
                                        {lang key='notificationsnone'}
                                    </li>
                                {/foreach}
                            </ul>
                        </div>
                    </div>

                    <div class="ml-auto">
                        <div class="input-group active-client" role="group">
                            <div class="input-group-prepend d-none d-md-inline">
                                <span class="input-group-text">{lang key='loggedInAs'}:</span>
                            </div>
                            <div class="btn-group">
                                <a href="{$WEB_ROOT}/clientarea.php?action=details" class="btn btn-active-client">
                                        <span>
                                            {if $client.companyname}
                                                {$client.companyname}
                                            {else}
                                                {$client.fullName}
                                            {/if}
                                        </span>
                                </a>
                                <a href="{routePath('user-accounts')}" class="btn" data-toggle="tooltip" data-placement="bottom" title="Switch Account">
                                    <i class="fad fa-random"></i>
                                </a>
                                {if $adminMasqueradingAsClient || $adminLoggedIn}
                                    <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                                        <i class="fas fa-redo-alt"></i>
                                        <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
                                    </a>
                                {/if}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    {/if}

    <div class="navbar navbar-light">
        <div class="container">
            <a class="navbar-brand mr-3" href="{$WEB_ROOT}/index.php">
                {if $assetLogoPath}
                    <img src="{$assetLogoPath}" alt="{$companyname}" class="logo-img">
                {else}
                    {$companyname}
                {/if}
            </a>
            <form method="post" action="{routePath('knowledgebase-search')}" class="form-inline ml-auto">
                <div class="input-group search d-none d-xl-flex">
                    <div class="input-group-prepend">
                        <button class="btn btn-default" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </div>
                    <input class="form-control appended-form-control font-weight-light" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                </div>
            </form>

            <ul class="navbar-nav toolbar">
                <li class="nav-item ml-3">
                    <a class="btn nav-link cart-btn" href="{$WEB_ROOT}/cart.php?a=view">
                        <i class="far fa-shopping-cart fa-fw"></i>
                        <span class="badge badge-info">{$cartitemcount}</span>
                        <span class="sr-only">{lang key="carttitle"}</span>
                    </a>
                </li>
                <li class="nav-item ml-3 d-xl-none">
                    <button class="btn nav-link" type="button" data-toggle="collapse" data-target="#mainNavbar">
                        <span class="fas fa-bars fa-fw"></span>
                    </button>
                </li>
            </ul>
        </div>
    </div>
    <div class="navbar navbar-expand-xl main-navbar-wrapper">
        <div class="container">
            <div class="collapse navbar-collapse" id="mainNavbar">
                <form method="post" action="{routePath('knowledgebase-search')}" class="d-xl-none">
                    <div class="input-group search w-100 mb-2">
                        <div class="input-group-prepend">
                            <button class="btn btn-default" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <input class="form-control prepended-form-control" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                    </div>
                </form>
                <ul id="nav" class="navbar-nav mr-auto">
                    {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
                </ul>
                <ul class="navbar-nav ml-auto">
                    {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
                </ul>
            </div>
        </div>
    </div>
</header>

{include file="$template/includes/network-issues-notifications.tpl"}

<nav class="master-breadcrumb" aria-label="breadcrumb">
    <div class="container d-flex align-items-center">
        {include file="$template/includes/breadcrumb.tpl"}
    </div>
</nav>

{include file="$template/includes/verifyemail.tpl"}

{if $templatefile == 'homepage'}
    {if $registerdomainenabled || $transferdomainenabled}
        {include file="$template/includes/domain-search.tpl"}
    {/if}
{/if}

<section id="main-body">

    <div class="{if !$skipMainBodyContainer}container{/if}">
        <div class="row">

            {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
                <div class="col-lg-4 col-xl-3">
                    <div class="sidebar">
                        {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-none d-lg-block sidebar">
                            {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                        </div>
                    {/if}
                </div>
            {/if}
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-lg-8 col-xl-9{else}col-12{/if} primary-content">
