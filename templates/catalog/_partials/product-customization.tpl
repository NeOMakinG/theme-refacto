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
<section class="product-customization js-product-customization">
  {if !$configuration.is_catalog}
    <div class="card card-body bg-light">
      <p class="h4 card-title">{l s='Product customization' d='Shop.Theme.Catalog'}</p>

      {block name='product_customization_form'}
        <form method="post" action="{$product.url}" enctype="multipart/form-data">
          {foreach from=$customizations.fields item="field"}
            <div class="product-customization__item mb-3">
              {if $field.type == 'text'}
                <textarea placeholder="{l s='Your message here' d='Shop.Forms.Help'}" class="form-control product-message" maxlength="250" {if $field.required} required {/if} name="{$field.input_name}"></textarea>
                <div class="form-text">{l s='250 char. max' d='Shop.Forms.Help'}</div>
                {if $field.text !== ''}
                  <div class="card card-body mt-2">
                    <h6 class="product-customization__message">{l s='Your customization:' d='Shop.Theme.Catalog'}</h6>
                    <p>{$field.text}</p>
                  </div>
                {/if}
              {elseif $field.type == 'image'}
                {if $field.is_customized}
                  <br>
                  <img src="{$field.image.small.url}" loading="lazy">
                  <a class="remove-image" href="{$field.remove_image_url}" rel="nofollow">{l s='Remove Image' d='Shop.Theme.Actions'}</a>
                {/if}
                <input class="form-control file-input js-file-input" {if $field.required} required {/if} type="file" name="{$field.input_name}">
                <div class="form-text">{l s='.png .jpg .gif' d='Shop.Forms.Help'}</div>
              {/if}
            </div>
          {/foreach}
          <div>
            <button class="btn btn-primary" type="submit" name="submitCustomizedData">{l s='Save Customization' d='Shop.Theme.Actions'}</button>
          </div>
        </form>
      {/block}
    </div>
  {/if}
</section>
