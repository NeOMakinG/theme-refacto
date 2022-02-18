{**
 * Copyright since 2007 PrestaShop SA and Contributors
 * PrestaShop is an International Registered Trademark & Property of PrestaShop SA
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License 3.0 (AFL-3.0)
 * that is bundled with this package in the file LICENSE.md.
 * It is also available through the world-wide-web at this URL:
 * https://opensource.org/licenses/AFL-3.0
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to https://devdocs.prestashop.com/ for more information.
 *
 * @author    PrestaShop SA and Contributors <contact@prestashop.com>
 * @copyright Since 2007 PrestaShop SA and Contributors
 * @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
 *}
{if $product.show_price}
  <div class="product__prices js-product-prices">

    {block name='product_price'}
      <div class="prices__wrapper">

        <div class="product__current-price">
          {capture name='custom_price'}{hook h='displayProductPriceBlock' product=$product type='custom_price' hook_origin='product_sheet'}{/capture}
          {if '' !== $smarty.capture.custom_price}
            {$smarty.capture.custom_price nofilter}
          {else}
            {$product.price}
          {/if}
        </div>

        {if $product.has_discount}
          <div class="product__discount">
            {hook h='displayProductPriceBlock' product=$product type="old_price"}
            <span class="product__price-regular">{$product.regular_price}</span>
            {if $product.discount_type === 'percentage'}
              <span class="product__discount-percentage">
                ({l s='Save %percentage%' d='Shop.Theme.Catalog' sprintf=['%percentage%' => $product.discount_percentage_absolute]})
              </span>
            {else}
              <span class="product__discount-amount">
                ({l s='Save %amount%' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.discount_to_display]})
              </span>
            {/if}
          </div>
        {/if}

      </div>
    {/block}

    {** OTHER PRICES TO STLYE LATER *}
    {block name='product_unit_price'}
      {if $displayUnitPrice}
        <p class="product__unit-price">{l s='(%unit_price%)' d='Shop.Theme.Catalog' sprintf=['%unit_price%' => $product.unit_price_full]}</p>
      {/if}
    {/block}

    {block name='product_without_taxes'}
      {if $priceDisplay == 2}
        <p class="product__price-taxless">{l s='%price% tax excl.' d='Shop.Theme.Catalog' sprintf=['%price%' => $product.price_tax_exc]}</p>
      {/if}
    {/block}

    {block name='product_pack_price'}
      {if $displayPackPrice}
        <p class="product__pack-price">{l s='Instead of %price%' d='Shop.Theme.Catalog' sprintf=['%price%' => $noPackPrice]}</p>
      {/if}
    {/block}

    {block name='product_ecotax'}
      {if $product.ecotax.amount> 0}
        <p class="product__ecotax-price">{l s='Including %amount% for ecotax' d='Shop.Theme.Catalog' sprintf=['%amount%' => $product.ecotax_tax_inc]}
          {if $product.has_discount}
            {l s='(not impacted by the discount)' d='Shop.Theme.Catalog'}
          {/if}
        </p>
      {/if}
    {/block}
    {** OTHER PRICES TO STLYE LATER *}

    {hook h='displayProductPriceBlock' product=$product type="weight" hook_origin='product_sheet'}

    <div class="product__tax-label">
      {if !$configuration.taxes_enabled}
        {l s='No tax' d='Shop.Theme.Catalog'}
      {elseif $configuration.display_taxes_label}
        {$product.labels.tax_long}
      {/if}
      {hook h='displayProductPriceBlock' product=$product type="price"}
      {hook h='displayProductPriceBlock' product=$product type="after_price"}
    </div>
  </div>
{/if}
