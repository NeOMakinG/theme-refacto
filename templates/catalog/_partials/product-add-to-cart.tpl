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
<div class="product__add-to-cart js-product-add-to-cart">
  {if !$configuration.is_catalog}

    <div class="mb-3">
    {block name='product_availability'}
      <span id="product__availability" class="product__availability js-product-availability">
        {if $product.show_availability && $product.availability_message}
          {if $product.availability == 'available'}
            <i class="material-icons rtl-no-flip product-available">&#xE5CA;</i>
          {elseif $product.availability == 'last_remaining_items'}
            <i class="material-icons product-last-items">&#xE002;</i>
          {else}
            <i class="material-icons product-unavailable">&#xE14B;</i>
          {/if}
          {$product.availability_message}
        {/if}
      </span>
    {/block}
    {block name='product_delivery_times'}
      {if $product.is_virtual	== 0}
        {if $product.additional_delivery_times == 1}
          {if $product.delivery_information}
            <span class="product__delivery__information">{$product.delivery_information}</span>
          {/if}
        {elseif $product.additional_delivery_times == 2}
          {if $product.quantity> 0}
            <span class="product__delivery__information">{$product.delivery_in_stock}</span>
          {* Out of stock message should not be displayed if customer can't order the product. *}
          {elseif $product.quantity <= 0 && $product.add_to_cart_url}
            <span class="product__delivery__information">{$product.delivery_out_stock}</span>
          {/if}
        {/if}
      {/if}
    {/block}
    </div>






    {block name='product_quantity'}
      <div class="row g-2">
        <div class="product-actions__quantity quantity-button js-quantity-button col-auto">
          <input
            type="number"
            name="qty"
            id="quantity_wanted"
            inputmode="numeric"
            pattern="[0-9]*"
            {if $product.quantity_wanted}
              value="{$product.quantity_wanted}"
              min="{$product.minimal_quantity}"
            {else}
              value="1"
              min="1"
            {/if}
            class="form-control"
            aria-label="{l s='Quantity' d='Shop.Theme.Actions'}"
         >
        </div>

        <div class="product-actions__button col">
          <button
            class="btn btn-primary btn-with-icon add-to-cart"
            data-button-action="add-to-cart"
            type="submit"
            {if !$product.add_to_cart_url}
              disabled
            {/if}
         >
            <i class="material-icons shopping-cart">&#xE547;</i>
            {l s='Add to cart' d='Shop.Theme.Actions'}
          </button>
        </div>

        {hook h='displayProductActions' product=$product}
      </div>
    {/block}

    {block name='product_minimal_quantity'}
      <p class="product__minimal-quantity js-product-minimal-quantity">
        {if $product.minimal_quantity> 1}
          {l
          s='The minimum purchase order quantity for the product is %quantity%.'
          d='Shop.Theme.Checkout'
          sprintf=['%quantity%' => $product.minimal_quantity]
          }
        {/if}
      </p>
    {/block}
  {/if}
</div>
