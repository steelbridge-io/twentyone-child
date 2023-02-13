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
<a href="tel:15307108726">CALL US: (530) 710-8726</a>
</span>
