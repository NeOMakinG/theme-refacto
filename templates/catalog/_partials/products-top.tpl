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
<div id="js-product-list-top" class="products-selection">
  <div class="products-selections-filters row">
    <div class="col-12 col-md-6 total-products order-2 order-md-1 mt-4 mt-md-0">
      {if $listing.pagination.total_items> 1}
        <p>{l s='There are %product_count% products.' d='Shop.Theme.Catalog' sprintf=['%product_count%' => $listing.pagination.total_items]}</p>
      {elseif $listing.pagination.total_items> 0}
        <p>{l s='There is 1 product.' d='Shop.Theme.Catalog'}</p>
      {/if}
    </div>

    <div class="col-md-6 order-1 order-md-2">
      <div class="d-flex align-items-center justify-content-md-end sort-by-row">
        {block name='sort_by'}
          {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        {/block}

        {if !empty($listing.rendered_facets)}
          <div class="col-4 d-block d-md-none filter-button">
            <button id="search_filter_toggler" class="btn btn-outline-primary w-full js-search-toggler" data-bs-toggle="offcanvas" data-bs-target="#offcanvas-faceted">
            <div class="material-icons">filter_list</div>
              {l s='Filter' d='Shop.Theme.Actions'}
            </button>
          </div>
        {/if}
      </div>
    </div>
  </div>
</div>
