
<div 
  class="info js-product-details accordion-item"
  id="product-details"
  data-product="{$product.embedded_attributes|json_encode}"
>
  <h5 class="info__title accordion-header" id="product-details-heading">
    <button class="accordion-button {if $product.description}collapsed{/if}" type="button" data-bs-toggle="collapse" data-bs-target="#product-details-collapse" aria-expanded="{if $product.description}false{else}true{/if}" 
      aria-controls="product-details-collapse">
      {l s='Product Details' d='Shop.Theme.Catalog'}
    </button>
  </h5>
  <div id="product-details-collapse" class="info__content accordion-collapse collapse {if !$product.description}show{/if}" data-bs-parent="#product-details-heading" aria-labelledby="product-details-heading">
    <div class="accordion-body">
      <ul class="product__details">

        {block name='product_reference'}
          {if isset($product_manufacturer->id)}
            <li class="detail">
              <div class="detail__left">
                <span class="detail__title">{l s='Brand' d='Shop.Theme.Catalog'}</span>
              </div>
              <div class="detail__right">
                {if isset($manufacturer_image_url)}
                  <a href="{$product_brand_url}">
                    <img src="{$manufacturer_image_url}" class="img-fluid detail__manufacturer-logo" alt="{$product_manufacturer->name}" loading="lazy" width="98" height="50">
                  </a>
                {else}
                  <a href="{$product_brand_url}">{$product_manufacturer->name}</a>
                {/if}
              </div>
            </li>

            {if isset($product.reference_to_display) && $product.reference_to_display neq ''}
              <li class="detail">
                <div class="detail__left">
                  <span class="detail__title">{l s='Reference' d='Shop.Theme.Catalog'}</span>
                </div>
                <div class="detail__right">
                  <span>{$product.reference_to_display}</span>
                </div>
              </li>
            {/if}
          {/if}
        {/block}

        {block name='product_quantities'}
          {if $product.show_quantities}
            <li class="detail">
              <div class="detail__left">
                <span class="detail__title">{l s='In stock' d='Shop.Theme.Catalog'}</span>
              </div>
              <div class="detail__right">
                <span data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
              </div>
            </li>
          {/if}
        {/block}

        {block name='product_availability_date'}
          {if $product.availability_date}
            <li class="detail">
              <div class="detail__left">
                <span class="detail__title">{l s='Availability date:' d='Shop.Theme.Catalog'}</span>
              </div>
              <div class="detail__right">
                <span>{$product.availability_date}</span>
              </div>
            </li>
          {/if}
        {/block}

        {block name='product_out_of_stock'}
          <li class="detail">
            <div class="detail__left">
              <span class="detail__title">{l s='Out of stock' d='Shop.Theme.Catalog'}</span>
            </div>
            <div class="detail__right">
              {hook h='actionProductOutOfStock' product=$product}
            </div>
          </li>
        {/block}

        {* if product have specific references, a table will be added to product details section *}
        {block name='product_condition'}
          {if $product.condition}
            <li class="detail">
              <div class="detail__left">
                <span class="detail__title">{l s='Condition' d='Shop.Theme.Catalog'}</span>
              </div>
              <div class="detail__right">
                <span>{$product.condition.label}</span>
              </div>
            </li>
          {/if}
        {/block}

        {block name='product_specific_references'}
          {if !empty($product.specific_references)}
            {foreach from=$product.specific_references item=reference key=key}
              <li class="detail">
                <div class="detail__left">
                  <span class="detail__title">{$key}</span>
                </div>
                <div class="detail__right">
                  <span>{$reference}</span>
                </div>
              </li>
            {/foreach}
          {/if}
        {/block}
      </ul>

    </div>
  </div>
</div>


{block name='product_features'}
  {if $product.grouped_features}
    <div class="info accordion-item" id="product-features">
      <h5 class="info__title accordion-header" id="product-features-heading">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#product-features-collapse" aria-expanded="false" 
          aria-controls="product-features-collapse">
          {l s='Data sheet' d='Shop.Theme.Catalog'}
        </button>
      </h5>
      <div id="product-features-collapse" class="info__content accordion-collapse collapse" data-bs-parent="#product-features-heading" aria-labelledby="product-features-heading">
        <div class="accordion-body">
          <ul class="product__features">
            {foreach from=$product.grouped_features item=feature}
              <li class="detail">
                <div class="detail__left">
                  <span class="detail__title">{$feature.name}</span>
                </div>
                <div class="detail__right">
                  <span>{$feature.value|escape:'htmlall'|nl2br nofilter}</span>
                </div>
              </li>
            {/foreach}
          </ul>
        </div>
      </div>
    </div>
  {/if}
{/block}
