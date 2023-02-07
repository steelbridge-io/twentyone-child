<ol class="breadcrumb">
    {foreach $breadcrumb as $item}
        <li class="breadcrumb-item{if $item@last} active{/if}"{if $item@last} aria-current="page"{/if}>
            {if !$item@last}<a href="{$item.link}">{/if}
                {$item.label}
                {if !$item@last}</a>{/if}
        </li>
    {/foreach}
</ol>
<span class="telephone-number">
<a href="https://calendly.com/parsonshosting/emergency-support">EMERGENCY support: Start Here. 24/7!</a>
</span>
