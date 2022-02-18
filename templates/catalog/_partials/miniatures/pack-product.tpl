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
{block name='pack_miniature_item'}
  <article class="product-pack border rounded mb-2 p-2">
    <a href="{$product.url}" title="{$product.name}" class="row align-items-center">
      <div class="product-pack__image col-2">
        {if !empty($product.default_image.medium)}
          <img
            src="{$product.default_image.medium.url}"
            {if !empty($product.default_image.legend)}
              alt="{$product.default_image.legend}"
              title="{$product.default_image.legend}"
            {else}
              alt="{$product.name}"
            {/if}
            loading="lazy"
            class="img-fluid rounded"
          >
        {else}
          <img src="{$urls.no_picture_image.bySize.medium_default.url}" loading="lazy" class="img-fluid rounded" />
        {/if}
      </div>

      <p class="product-pack__name col-6 my-0">
        {$product.name}
      </p>

      {if $showPackProductsPrice}
        <p class="product-pack__price col text-center">
          <strong>{$product.price}</strong>
        </p>
      {/if}

      <p class="product-pack__quantity col text-center my-0">
        x {$product.pack_quantity}
      </p>
    </a>
  </article>
{/block}
