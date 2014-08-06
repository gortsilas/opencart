<?php echo $header; ?><?php echo $menu; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"> <a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a> </div>
      <h1><i class="fa fa-pencil"></i> <?php echo $heading_title; ?></h1>
    </div>
  </div>
  <div class="container-fluid">
    <div class="progress">
      <div id="progress-bar" class="progress-bar progress-bar-success" style="width: 20%;" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">0%</div>
    </div>
    <form class="form-horizontal">
      <ul class="nav nav-tabs nav-justified">
        <li class="active"><a href="#tab-customer" data-toggle="tab">1. <?php echo $tab_customer; ?></a></li>
        <li class="disabled"><a href="#tab-cart" data-toggle="tab">2. <?php echo $tab_product; ?></a></li>
        <li class="disabled"><a href="#tab-payment" data-toggle="tab">3. <?php echo $tab_payment; ?></a></li>
        <li class="disabled"><a href="#tab-shipping" data-toggle="tab">4. <?php echo $tab_shipping; ?></a></li>
        <li class="disabled"><a href="#tab-total" data-toggle="tab">5. <?php echo $tab_total; ?></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tab-customer">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-store"><?php echo $entry_store; ?></label>
            <div class="col-sm-10">
              <select name="store_id" id="input-store" class="form-control">
                <option value="0"><?php echo $text_default; ?></option>
                <?php foreach ($stores as $store) { ?>
                <?php if ($store['store_id'] == $store_id) { ?>
                <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $store['store_id']; ?>"><?php echo $store['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-customer"><?php echo $entry_customer; ?></label>
            <div class="col-sm-10">
              <input type="text" name="customer" value="<?php echo $customer; ?>" placeholder="<?php echo $entry_customer; ?>" id="input-customer" class="form-control" />
              <input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-customer-group"><?php echo $entry_customer_group; ?></label>
            <div class="col-sm-10">
              <select name="customer_group_id" id="input-customer-group" <?php echo ($customer_id ? 'disabled="disabled"' : ''); ?> class="form-control">
                <?php foreach ($customer_groups as $customer_group) { ?>
                <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-firstname"><?php echo $entry_firstname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="<?php echo $firstname; ?>" id="input-firstname" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="<?php echo $lastname; ?>" id="input-lastname" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-telephone"><?php echo $entry_telephone; ?></label>
            <div class="col-sm-10">
              <input type="text" name="telephone" value="<?php echo $telephone; ?>" id="input-telephone" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-fax"><?php echo $entry_fax; ?></label>
            <div class="col-sm-10">
              <input type="text" name="fax" value="<?php echo $fax; ?>" id="input-fax" class="form-control" />
            </div>
          </div>
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'account') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $account_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($account_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $account_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo $custom_field['value']; ?></textarea>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default button-upload"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($account_custom_field[$custom_field['custom_field_id']]) ? $account_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <div class="text-right">
            <button type="button" id="button-customer" class="btn btn-primary"><i class="fa fa-arrow-right"></i> <?php echo $button_continue; ?></button>
          </div>
        </div>
        <div class="tab-pane" id="tab-cart">
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $column_product; ?></td>
                  <td class="text-left"><?php echo $column_model; ?></td>
                  <td class="text-right"><?php echo $column_quantity; ?></td>
                  <td class="text-right"><?php echo $column_price; ?></td>
                  <td class="text-right"><?php echo $column_total; ?></td>
                  <td></td>
                </tr>
              </thead>
              <tbody id="cart">
                <?php $product_row = 0; ?>
                <?php foreach ($order_products as $order_product) { ?>
                <tr id="product-row<?php echo $product_row; ?>">
                  <td class="text-left"><?php echo $order_product['name']; ?><br />
                    <input type="hidden" name="product_id" value="<?php echo $order_product['product_id']; ?>" />
                    <input type="hidden" name="quantity" value="<?php echo $order_product['quantity']; ?>" />
                    <?php foreach ($order_product['option'] as $option) { ?>
                    - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                    <?php if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'image') { ?>
                    <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['product_option_value_id']; ?>" />
                    <?php } ?>
                    <?php if ($option['type'] == 'checkbox') { ?>
                    <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option['product_option_value_id']; ?>" />
                    <?php } ?>
                    <?php if ($option['type'] == 'text' || $option['type'] == 'textarea' || $option['type'] == 'file' || $option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') { ?>
                    <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" />
                    <?php } ?>
                    <?php } ?></td>
                  <td class="text-left"><?php echo $order_product['model']; ?></td>
                  <td class="text-right"><?php echo $order_product['quantity']; ?></td>
                  <td class="text-right"><?php echo $order_product['price']; ?></td>
                  <td class="text-right"><?php echo $order_product['total']; ?></td>
                  <td class="text-center" style="width: 3px;"><button type="button" onclick="$('#product-row<?php echo $product_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $product_row++; ?>
                <?php } ?>
                <?php $voucher_row = 0; ?>
                <?php foreach ($order_vouchers as $order_voucher) { ?>
                <tr id="voucher-row<?php echo $voucher_row; ?>">
                  <td class="text-left"><?php echo $order_voucher['description']; ?>
                    <input type="hidden" name="from_name" value="<?php echo $order_voucher['from_name']; ?>" />
                    <input type="hidden" name="from_email" value="<?php echo $order_voucher['from_email']; ?>" />
                    <input type="hidden" name="to_name" value="<?php echo $order_voucher['to_name']; ?>" />
                    <input type="hidden" name="to_email" value="<?php echo $order_voucher['to_email']; ?>" />
                    <input type="hidden" name="voucher_theme_id" value="<?php echo $order_voucher['voucher_theme_id']; ?>" />
                    <input type="hidden" name="message" value="<?php echo $order_voucher['message']; ?>" />
                    <input type="hidden" name="amount" value="<?php echo $order_voucher['amount']; ?>" /></td>
                  <td class="text-left"></td>
                  <td class="text-right">1</td>
                  <td class="text-right"><?php echo $order_voucher['amount']; ?></td>
                  <td class="text-right"><?php echo $order_voucher['amount']; ?></td>
                  <td class="text-center" style="width: 3px;"><button type="button" onclick="$('#voucher-row<?php echo $voucher_row; ?>').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>
                </tr>
                <?php $voucher_row++; ?>
                <?php } ?>
                <?php if (!$order_products && !$order_vouchers) { ?>
                <tr>
                  <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
          <ul class="nav nav-tabs nav-justified">
            <li class="active"><a href="#tab-product" data-toggle="tab"><?php echo $tab_product; ?></a></li>
            <li><a href="#tab-voucher" data-toggle="tab"><?php echo $tab_voucher; ?></a></li>
          </ul>
          <div class="tab-content">
            <div class="tab-pane active" id="tab-product">
              <fieldset>
                <legend><?php echo $text_product; ?></legend>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="product" value="" id="input-product" class="form-control" />
                    <input type="hidden" name="product_id" value="" />
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="quantity" value="1" id="input-quantity" class="form-control" />
                  </div>
                </div>
                <div id="option"></div>
              </fieldset>
              <div class="text-right">
                <button type="button" id="button-product" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_product_add; ?></button>
              </div>
            </div>
            <div class="tab-pane" id="tab-voucher">
              <fieldset>
                <legend><?php echo $text_voucher; ?></legend>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-to-name"><?php echo $entry_to_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="to_name" value="" id="input-to-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-to-email"><?php echo $entry_to_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="to_email" value="" id="input-to-email" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-from-name"><?php echo $entry_from_name; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="from_name" value="" id="input-from-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-from-email"><?php echo $entry_from_email; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="from_email" value="" id="input-from-email" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-theme"><?php echo $entry_theme; ?></label>
                  <div class="col-sm-10">
                    <select name="voucher_theme_id" id="input-theme" class="form-control">
                      <?php foreach ($voucher_themes as $voucher_theme) { ?>
                      <option value="<?php echo $voucher_theme['voucher_theme_id']; ?>"><?php echo $voucher_theme['name']; ?></option>
                      <?php } ?>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 control-label" for="input-message"><?php echo $entry_message; ?></label>
                  <div class="col-sm-10">
                    <textarea name="message" rows="5" id="input-message" class="form-control"></textarea>
                  </div>
                </div>
                <div class="form-group required">
                  <label class="col-sm-2 control-label" for="input-amount"><?php echo $entry_amount; ?></label>
                  <div class="col-sm-10">
                    <input type="text" name="amount" value="<?php echo $voucher_min; ?>" id="input-amount" class="form-control" />
                  </div>
                </div>
              </fieldset>
              <div class="text-right">
                <button type="button" id="button-voucher" class="btn btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $button_voucher_add; ?></button>
              </div>
            </div>
          </div>
          <br />
          <div class="row">
            <div class="col-sm-6 text-left">
              <button type="button" id="button-back" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
            </div>
            <div class="col-sm-6 text-right">
              <button type="button" id="button-cart" class="btn btn-primary"><i class="fa fa-arrow-right"></i> <?php echo $button_continue; ?></button>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="tab-payment">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-payment-address"><?php echo $entry_address; ?></label>
            <div class="col-sm-10">
              <select name="payment_address" id="input-payment-address" class="form-control">
                <option value="0" selected="selected"><?php echo $text_none; ?></option>
                <?php foreach ($addresses as $address) { ?>
                <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['country']; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payment-firstname"><?php echo $entry_firstname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="<?php echo $payment_firstname; ?>" id="input-payment-firstname" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payment-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="<?php echo $payment_lastname; ?>" id="input-payment-lastname" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-payment-company"><?php echo $entry_company; ?></label>
            <div class="col-sm-10">
              <input type="text" name="company" value="<?php echo $payment_company; ?>" id="input-payment-company" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payment-address-1"><?php echo $entry_address_1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="address_1" value="<?php echo $payment_address_1; ?>" id="input-payment-address-1" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-payment-address-2"><?php echo $entry_address_2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="address_2" value="<?php echo $payment_address_2; ?>" id="input-payment-address-2" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payment-city"><?php echo $entry_city; ?></label>
            <div class="col-sm-10">
              <input type="text" name="city" value="<?php echo $payment_city; ?>" id="input-payment-city" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payment-postcode"><?php echo $entry_postcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="postcode" value="<?php echo $payment_postcode; ?>" id="input-payment-postcode" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payment-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
              <select name="country_id" id="input-payment-country" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $payment_country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-payment-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-10">
              <select name="zone_id" id="input-payment-zone" class="form-control">
              </select>
            </div>
          </div>
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'address') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($payment_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $payment_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($payment_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $payment_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($payment_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $payment_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default button-upload"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($payment_custom_field[$custom_field['custom_field_id']]) ? $payment_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-payment-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <div class="row">
            <div class="col-sm-6 text-left">
              <button type="button" id="button-back" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
            </div>
            <div class="col-sm-6 text-right">
              <button type="button" id="button-payment-address" class="btn btn-primary"><i class="fa fa-arrow-right"></i> <?php echo $button_continue; ?></button>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="tab-shipping">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-shipping-address"><?php echo $entry_address; ?></label>
            <div class="col-sm-10">
              <select name="shipping_address" id="input-shipping-address" class="form-control">
                <option value="0" selected="selected"><?php echo $text_none; ?></option>
                <?php foreach ($addresses as $address) { ?>
                <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname'] . ' ' . $address['lastname'] . ', ' . $address['address_1'] . ', ' . $address['city'] . ', ' . $address['country']; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shipping-firstname"><?php echo $entry_firstname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="firstname" value="<?php echo $shipping_firstname; ?>" id="input-shipping-firstname" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shipping-lastname"><?php echo $entry_lastname; ?></label>
            <div class="col-sm-10">
              <input type="text" name="lastname" value="<?php echo $shipping_lastname; ?>" id="input-shipping-lastname" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-shipping-company"><?php echo $entry_company; ?></label>
            <div class="col-sm-10">
              <input type="text" name="company" value="<?php echo $shipping_company; ?>" id="input-shipping-company" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shipping-address-1"><?php echo $entry_address_1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="address_1" value="<?php echo $shipping_address_1; ?>" id="input-shipping-address-1" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-shipping-address-2"><?php echo $entry_address_2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="address_2" value="<?php echo $shipping_address_2; ?>" id="input-shipping-address-2" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shipping-city"><?php echo $entry_city; ?></label>
            <div class="col-sm-10">
              <input type="text" name="city" value="<?php echo $shipping_city; ?>" id="input-shipping-city" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shipping-postcode"><?php echo $entry_postcode; ?></label>
            <div class="col-sm-10">
              <input type="text" name="postcode" value="<?php echo $shipping_postcode; ?>" id="input-shipping-postcode" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shipping-country"><?php echo $entry_country; ?></label>
            <div class="col-sm-10">
              <select name="country_id" id="input-shipping-country" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($countries as $country) { ?>
                <?php if ($country['country_id'] == $shipping_country_id) { ?>
                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-shipping-zone"><?php echo $entry_zone; ?></label>
            <div class="col-sm-10">
              <select name="zone_id" id="input-shipping-zone" class="form-control">
              </select>
            </div>
          </div>
          <?php foreach ($custom_fields as $custom_field) { ?>
          <?php if ($custom_field['location'] == 'address') { ?>
          <?php if ($custom_field['type'] == 'select') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <select name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <?php if (isset($ashipping_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $shipping_custom_field[$custom_field['custom_field_id']]) { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>" selected="selected"><?php echo $custom_field_value['name']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $custom_field_value['custom_field_value_id']; ?>"><?php echo $custom_field_value['name']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'radio') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="radio">
                  <?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && $custom_field_value['custom_field_value_id'] == $shipping_custom_field[$custom_field['custom_field_id']]) { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="radio" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'checkbox') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div>
                <?php foreach ($custom_field['custom_field_value'] as $custom_field_value) { ?>
                <div class="checkbox">
                  <?php if (isset($shipping_custom_field[$custom_field['custom_field_id']]) && in_array($custom_field_value['custom_field_value_id'], $shipping_custom_field[$custom_field['custom_field_id']])) { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" checked="checked" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } else { ?>
                  <label>
                    <input type="checkbox" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>][]" value="<?php echo $custom_field_value['custom_field_value_id']; ?>" />
                    <?php echo $custom_field_value['name']; ?></label>
                  <?php } ?>
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'text') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'textarea') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <textarea name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" rows="5" placeholder="<?php echo $custom_field['name']; ?>" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control"><?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?></textarea>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'file') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <button type="button" id="button-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="btn btn-default button-upload"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : ''); ?>" id="input-custom-field<?php echo $custom_field['custom_field_id']; ?>" />
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'date') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group date">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'time') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group time">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php if ($custom_field['type'] == 'datetime') { ?>
          <div class="form-group custom-field custom-field<?php echo $custom_field['custom_field_id']; ?>">
            <label class="col-sm-2 control-label" for="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>"><?php echo $custom_field['name']; ?></label>
            <div class="col-sm-10">
              <div class="input-group datetime">
                <input type="text" name="custom_field[<?php echo $custom_field['custom_field_id']; ?>]" value="<?php echo (isset($shipping_custom_field[$custom_field['custom_field_id']]) ? $shipping_custom_field[$custom_field['custom_field_id']] : $custom_field['value']); ?>" placeholder="<?php echo $custom_field['name']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-shipping-custom-field<?php echo $custom_field['custom_field_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
          </div>
          <?php } ?>
          <?php } ?>
          <?php } ?>
          <div class="row">
            <div class="col-sm-6 text-left">
              <button type="button" id="button-back" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
            </div>
            <div class="col-sm-6 text-right">
              <button type="button" id="button-shipping-address" class="btn btn-primary"><i class="fa fa-arrow-right"></i> <?php echo $button_continue; ?></button>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="tab-total">
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td class="text-left"><?php echo $column_product; ?></td>
                  <td class="text-left"><?php echo $column_model; ?></td>
                  <td class="text-right"><?php echo $column_quantity; ?></td>
                  <td class="text-right"><?php echo $column_price; ?></td>
                  <td class="text-right"><?php echo $column_total; ?></td>
                </tr>
              </thead>
              <tbody id="total">
                <?php $total_row = 0; ?>
                <?php if ($order_products || $order_vouchers || $order_totals) { ?>
                <?php foreach ($order_products as $order_product) { ?>
                <tr>
                  <td class="text-left"><?php echo $order_product['name']; ?><br />
                    <?php foreach ($order_product['option'] as $option) { ?>
                    - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $order_product['model']; ?></td>
                  <td class="text-right"><?php echo $order_product['quantity']; ?></td>
                  <td class="text-right"><?php echo $order_product['price']; ?></td>
                  <td class="text-right"><?php echo $order_product['total']; ?></td>
                </tr>
                <?php } ?>
                <?php foreach ($order_vouchers as $order_voucher) { ?>
                <tr>
                  <td class="text-left"><?php echo $order_voucher['description']; ?></td>
                  <td class="text-left"></td>
                  <td class="text-right">1</td>
                  <td class="text-right"><?php echo $order_voucher['amount']; ?></td>
                  <td class="text-right"><?php echo $order_voucher['amount']; ?></td>
                </tr>
                <?php } ?>
                <?php foreach ($order_totals as $order_total) { ?>
                <tr id="total-row<?php echo $total_row; ?>">
                  <td class="text-right" colspan="4"><?php echo $order_total['title']; ?>:</td>
                  <td class="text-right"><?php echo $order_total['value']; ?></td>
                </tr>
                <?php $total_row++; ?>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="5"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
          <fieldset>
            <legend><?php echo $text_order; ?></legend>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-shipping-method"><?php echo $entry_shipping_method; ?></label>
              <div class="col-sm-10">
                <div class="input-group">
                  <select name="shipping" id="input-shipping-method" class="form-control">
                    <option value="shipping_method"><?php echo $text_select; ?></option>
                    <?php if ($shipping_code) { ?>
                    <option value="<?php echo $shipping_code; ?>" selected="selected"><?php echo $shipping_method; ?></option>
                    <?php } ?>
                  </select>
                  <span class="input-group-btn">
                  <button type="button" id="button-shipping-method" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-payment-method"><?php echo $entry_payment_method; ?></label>
              <div class="col-sm-10">
                <div class="input-group">
                  <select name="payment_method" id="input-payment-method" class="form-control">
                    <option value=""><?php echo $text_select; ?></option>
                    <?php if ($payment_code) { ?>
                    <option value="<?php echo $payment_code; ?>" selected="selected"><?php echo $payment_method; ?></option>
                    <?php } ?>
                  </select>
                  <span class="input-group-btn">
                  <button type="button" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-coupon"><?php echo $entry_coupon; ?></label>
              <div class="col-sm-10">
                <div class="input-group">
                  <input type="text" name="coupon" value="<?php echo $coupon; ?>" id="input-coupon" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" id="button-coupon" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-voucher"><?php echo $entry_voucher; ?></label>
              <div class="col-sm-10">
                <div class="input-group">
                  <input type="text" name="voucher" value="<?php echo $voucher; ?>" id="input-voucher" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" id="button-voucher" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-reward"><?php echo $entry_reward; ?></label>
              <div class="col-sm-10">
                <div class="input-group">
                  <input type="text" name="reward" value="<?php echo $reward; ?>" id="input-reward" class="form-control" />
                  <span class="input-group-btn">
                  <button type="button" id="button-reward" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                  </span></div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-order-status"><?php echo $entry_order_status; ?></label>
              <div class="col-sm-10">
                <select name="order_status_id" id="input-order-status" class="form-control">
                  <?php foreach ($order_statuses as $order_status) { ?>
                  <?php if ($order_status['order_status_id'] == $order_status_id) { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-comment"><?php echo $entry_comment; ?></label>
              <div class="col-sm-10">
                <textarea name="comment" rows="5" id="input-comment" class="form-control"><?php echo $comment; ?></textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-affiliate"><?php echo $entry_affiliate; ?></label>
              <div class="col-sm-10">
                <input type="text" name="affiliate" value="<?php echo $affiliate; ?>" id="input-affiliate" class="form-control" />
                <input type="hidden" name="affiliate_id" value="<?php echo $affiliate_id; ?>" />
              </div>
            </div>
          </fieldset>
          <div class="row">
            <div class="col-sm-6 text-left">
              <button type="button" id="button-back" class="btn btn-default"><i class="fa fa-arrow-left"></i> <?php echo $button_back; ?></button>
            </div>
            <div class="col-sm-6 text-right">
              <button type="button" id="button-save" class="btn btn-primary"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></button>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
// Disable the tabs
$('.nav-tabs a').on('click', function (e) {
	e.preventDefault();
});

// Add all products to the cart using the api
$('#tab-cart tbody tr').each(function(index, element) {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/add',
		type: 'post',
		data: $(element).find('input'),
		dataType: 'html',
		beforeSend: function() {
			$('#button-customer i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-customer').prop('disabled', true);
		},
		complete: function() {
			$('#button-customer i').replaceWith('<i class="fa fa-arrow-right"></i>');
			$('#button-customer').prop('disabled', false);
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			alert(json);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});	
				
// Add all vouchers to the cart using the api
$('#tab-cart tbody tr').each(function(index, element) {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/voucher/add',
		type: 'post',
		data: $(element).find('input'),
		dataType: 'html',
		beforeSend: function() {
			$('#button-customer i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-customer').prop('disabled', true);
		},
		complete: function() {
			$('#button-customer i').replaceWith('<i class="fa fa-arrow-right"></i>');
			$('#button-customer').prop('disabled', false);
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$('#content').delegate('.button-upload', 'click', function() {
	var node = this;
	
	$('#form-upload').remove();
	
	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	$('#form-upload input[name=\'file\']').on('change', function() {
		$.ajax({
			url: 'index.php?route=tool/upload/upload&token=<?php echo $token; ?>',
			type: 'post',		
			dataType: 'json',
			data: new FormData($(this).parent()[0]),
			cache: false,
			contentType: false,
			processData: false,		
			beforeSend: function() {
				$(node).find('i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
				$(node).prop('disabled', true);
			},
			complete: function() {
				$(node).find('i').replaceWith('<i class="fa fa-upload"></i>');
				$(node).prop('disabled', false);
			},		
			success: function(json) {
				if (json['error']) {
					$(node).parent().find('input[type=\'hidden\']').after('<div class="text-danger">' + json['error'] + '</div>');
				}
							
				if (json['success']) {
					alert(json['success']);
				}
				
				if (json['code']) {
					$(node).parent().find('input[type=\'hidden\']').attr('value', json['code']);
				}
			},			
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	});
});

// Customer
$('input[name=\'customer\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=sale/customer/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				json.unshift({
					customer_id: '0',
					customer_group_id: '<?php echo $customer_group_id; ?>',						
					name: '<?php echo $text_none; ?>',
					customer_group: '',
					firstname: '',
					lastname: '',
					email: '',
					telephone: '',
					fax: '',
					custom_field: [],
					address: []			
				});				
				
				response($.map(json, function(item) {
					return {
						category: item['customer_group'],
						label: item['name'],
						value: item['customer_id'],
						customer_group_id: item['customer_group_id'],						
						firstname: item['firstname'],
						lastname: item['lastname'],
						email: item['email'],
						telephone: item['telephone'],
						fax: item['fax'],
						custom_field: item['custom_field'],
						address: item['address']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'customer\']').val(item['label']);
		$('input[name=\'customer_id\']').val(item['value']);
		$('input[name=\'firstname\']').attr('value', item['firstname']);
		$('input[name=\'lastname\']').attr('value', item['lastname']);
		$('input[name=\'email\']').attr('value', item['email']);
		$('input[name=\'telephone\']').attr('value', item['telephone']);
		$('input[name=\'fax\']').attr('value', item['fax']);
		
		html = '<option value="0"><?php echo $text_none; ?></option>'; 
			
		for (i in  item['address']) {
			html += '<option value="' + item['address'][i]['address_id'] + '">' + item['address'][i]['firstname'] + ' ' + item['address'][i]['lastname'] + ', ' + item['address'][i]['address_1'] + ', ' + item['address'][i]['city'] + ', ' + item['address'][i]['country'] + '</option>';
		}
		
		$('select[name=\'shipping_address\']').html(html);
		$('select[name=\'payment_address\']').html(html);
		
		$('select[name=\'customer_group_id\']').prop('disabled', false);
		$('select[name=\'customer_group_id\']').prop('value', item['customer_group_id']);
		$('select[name=\'customer_group_id\']').trigger('change');
			
		if (item['value']) {	
			$('select[name=\'customer_group_id\']').prop('disabled', true); 		
		}	
				
		for (i in custom_field) {
			alert(custom_field[i]);
		}
	}
});
		
// Custom Fields
$('select[name=\'customer_group_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=sale/customer/custom_field&token=<?php echo $token; ?>&customer_group_id=' + this.value,
		dataType: 'json',	
		success: function(json) {
			$('.custom-field').hide();
			$('.custom-field').removeClass('required');
			
			for (i = 0; i < json.length; i++) {
				custom_field = json[i];
				
				$('.custom-field' + custom_field['custom_field_id']).show();
				
				if (custom_field['required']) {
					$('.custom-field' + custom_field['custom_field_id']).addClass('required');
				}
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'customer_group_id\']').trigger('change');

$('#button-customer').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/customer',
		type: 'post',
		data: $('#tab-customer input[type=\'text\'], #tab-customer input[type=\'hidden\'], #tab-customer input[type=\'radio\']:checked, #tab-customer input[type=\'checkbox\']:checked, #tab-customer select, #tab-customer textarea'),
		dataType: 'html',
		beforeSend: function() {
			$('#button-customer i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-customer').prop('disabled', true);
		},
		complete: function() {
			$('#button-customer i').replaceWith('<i class="fa fa-arrow-right"></i>');
			$('#button-customer').prop('disabled', false);
		},
		success: function(json) {
			alert(json);
			
			$('.alert, .text-danger').remove();

			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}				
				
				if (json['error']['firstname']) {
					$('input[name=\'firstname\']').after('<div class="text-danger">' + json['error']['firstname'] + '</div');
				}					
				
				if (json['error']['lastname']) {
					$('input[name=\'lastname\']').after('<div class="text-danger">' + json['error']['lastname'] + '</div');
				}	
				
				if (json['error']['email']) {
					$('input[name=\'email\']').after('<div class="text-danger">' + json['error']['email'] + '</div');
				}
				
				if (json['error']['telephone']) {
					$('input[name=\'telephone\']').after('<div class="text-danger">' + json['error']['telephone'] + '</div');
				}
				
				if (json['error']['custom_field']) {	
					for (i in json['error']['custom_field']) {
						$('#input-custom-field' + i).after('<div class="text-danger">' + json['error']['custom_field'][i] + '</div>');
					}
				}					
			} else {
				$('a[href=\'#tab-customer\']').parent().removeClass('active');
				$('a[href=\'#tab-customer\']').parent().addClass('disabled');
				$('#tab-customer').removeClass('active');
				
				$('a[href=\'#tab-cart\']').parent().removeClass('disabled');
				$('a[href=\'#tab-cart\']').parent().addClass('active');
				$('#tab-cart').addClass('active');		
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
				
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id'],
						model: item['model'],
						option: item['option'],
						price: item['price']						
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product\']').val(item['label']);
		$('input[name=\'product_id\']').val(item['value']);
		
		if (item['option'] != '') {
 			html  = '<fieldset>';
            html += '  <legend><?php echo $entry_option; ?></legend>';
			  
			for (i = 0; i < item['option'].length; i++) {
				option = item['option'][i];
				
				if (option['type'] == 'select') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""><?php echo $text_select; ?></option>';
				
					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];
						
						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '</option>';
					}
						
					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}
				
				if (option['type'] == 'radio') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""><?php echo $text_select; ?></option>';
				
					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];
						
						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '</option>';
					}
						
					html += '    </select>';
					html += '  </div>';
					html += '</div>';
				}
					
				if (option['type'] == 'checkbox') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <div id="input-option' + option['product_option_id'] + '">';
					
					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];
						
						html += '<div class="checkbox">';
						
						html += '  <label><input type="checkbox" name="option[' + option['product_option_id'] + '][]" value="' + option_value['product_option_value_id'] + '" /> ' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '  </label>';
						html += '</div>';
					}
										
					html += '    </div>';
					html += '  </div>';
					html += '</div>';
				}
			
				if (option['type'] == 'image') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <select name="option[' + option['product_option_id'] + ']" id="input-option' + option['product_option_id'] + '" class="form-control">';
					html += '      <option value=""><?php echo $text_select; ?></option>';
				
					for (j = 0; j < option['product_option_value'].length; j++) {
						option_value = option['product_option_value'][j];
						
						html += '<option value="' + option_value['product_option_value_id'] + '">' + option_value['name'];
						
						if (option_value['price']) {
							html += ' (' + option_value['price_prefix'] + option_value['price'] + ')';
						}
						
						html += '</option>';
					}
						
					html += '    </select>';					
					html += '  </div>';
					html += '</div>';
				}
						
				if (option['type'] == 'text') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" id="input-option' + option['product_option_id'] + '" class="form-control" /></div>';
					html += '</div>';					
				}
				
				if (option['type'] == 'textarea') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><textarea name="option[' + option['product_option_id'] + ']" rows="5" id="input-option' + option['product_option_id'] + '" class="form-control">' + option['value'] + '</textarea></div>';
					html += '</div>';
				}
				
				if (option['type'] == 'file') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10">';
					html += '    <button type="button" id="button-upload' + option['product_option_id'] + '" class="btn btn-default button-upload"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>';
					html += '    <input type="hidden" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" id="input-option' + option['product_option_id'] + '" />';
					html += '  </div>';
					html += '</div>';
				}
				
				if (option['type'] == 'date') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-3"><div class="input-group date"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-format="YYYY-MM-DD" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';
				}
				
				if (option['type'] == 'datetime') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><div class="input-group datetime"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-format="YYYY-MM-DD HH:mm" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';					
				}
				
				if (option['type'] == 'time') {
					html += '<div class="form-group' + (option['required'] ? ' required' : '') + '">';
					html += '  <label class="col-sm-2 control-label" for="input-option' + option['product_option_id'] + '">' + option['name'] + '</label>';
					html += '  <div class="col-sm-10"><div class="input-group time"><input type="text" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" placeholder="' + option['name'] + '" data-format="HH:mm" id="input-option' + option['product_option_id'] + '" class="form-control" /><span class="input-group-btn"><button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
					html += '</div>';					
				}
			}
			
			html += '</fieldset>';
			
			$('#option').html(html);
			
			$('.date').datetimepicker({
				pickTime: false
			});
			
			$('.datetime').datetimepicker({
				pickDate: true,
				pickTime: true
			});
			
			$('.time').datetimepicker({
				pickDate: false
			});
		} else {
			$('#option').html('');
		}		
	}	
});

$('#button-refreshe').on('click', function() {
	// Now fill the 
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/products',
		dataType: 'json',
		success: function(json) {
			$('.alert, .text-danger').remove();
		
			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				
				if (json['error']['minimum']) {
					for (i in json['error']['minimum']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['minimum'][i] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					}
				}
			}				
			
			if (json['products']) {		
				var product_row = 0;
		
				html = '';
				
				for (i = 0; i < json['products'].length; i++) {
					product = json['products'][i];
					
					html += '<tr id="product-row' + product_row + '">';
					html += '  <td class="text-left">' + product['name'] + '<br /><input type="hidden" name="product_id" value="' + product['product_id'] + '" />';
					
					if (product['option']) {
						for (j = 0; j < product['option'].length; j++) {
							option = product['option'][j];
							
							html += '  - <small>' + option['name'] + ': ' + option['value'] + '</small><br />';
							
							if (option['type'] == 'select' || option['type'] == 'radio' || option['type'] == 'image') {
								html += '<input type="hidden" name="option[' + option['product_option_id'] + ']" value="' + option['product_option_value_id'] + '" />';
							}
							
							if (option['type'] == 'checkbox') {
								html += '<input type="hidden" name="option[' + option['product_option_id'] + '][]" value="' + option['product_option_value_id'] + '" />';
							}
							
							if (option['type'] == 'text' || option['type'] == 'textarea' || option['type'] == 'file' || option['type'] == 'date' || option['type'] == 'datetime' || option['type'] == 'time') {
								html += '<input type="hidden" name="option[' + option['product_option_id'] + ']" value="' + option['value'] + '" />';
							}
						}
					}
					
					html += '  </td>';
					
					html += '  <td class="text-left">' + product['model'] + '</td>';
					html += '  <td class="text-right">' + product['quantity'] + '<input type="hidden" name="quantity" value="' + product['quantity'] + '" /></td>';
					html += '  <td class="text-right">' + product['price'] + '</td>';
					html += '  <td class="text-right">' + product['total'] + '</td>';
					html += '  <td class="text-center" style="width: 3px;"><button type="button" onclick="$(\'#product-row' + product_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
					html += '</tr>';
					
					product_row++;			
				}
				
				$('#product').html(html);
			} 
					
			if (json['vouchers']) {
				var voucher_row = 0;
				
				 html = '';
				 
				 for (i in json['vouchers']) {
					voucher = json['vouchers'][i];
					 
					html += '<tr id="voucher-row' + voucher_row + '">';
					html += '  <td class="text-left">' + voucher['description'];
					html += '  <input type="hidden" name="from_name" value="' + voucher['from_name'] + '" />';
					html += '  <input type="hidden" name="from_email" value="' + voucher['from_email'] + '" />';
					html += '  <input type="hidden" name="to_name" value="' + voucher['to_name'] + '" />';
					html += '  <input type="hidden" name="to_email" value="' + voucher['to_email'] + '" />';
					html += '  <input type="hidden" name="voucher_theme_id" value="' + voucher['voucher_theme_id'] + '" />';	
					html += '  <input type="hidden" name="message" value="' + voucher['message'] + '" />';
					html += '  <input type="hidden" name="amount" value="' + voucher['amount'] + '" />';
					html += '  </td>';
					html += '  <td class="text-left"></td>';
					html += '  <td class="text-right">1</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '  <td class="text-center" style="width: 3px;"><button type="button" onclick="$(\'#voucher-row' + voucher_row + '\').remove(); $(\'#button-refresh\').trigger(\'click\');" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
					html += '</tr>';	
				  
					voucher_row++;
				}
				  
				$('#voucher').html(html);				
			}
			
			if (!json['products'] && !json['vouchers']) {				
				html  = '<tr>';
				html += '  <td colspan="6" class="text-center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	
		
				$('#product').html(html);
			}

			// Totals
			html = '';
			
			if (json['products']) {
				for (i = 0; i < json['products'].length; i++) {
					product = json['products'][i];
					
					html += '<tr>';
					html += '  <td class="text-left">' + product['name'] + '<br />';
					
					if (product['option']) {
						for (j = 0; j < product['option'].length; j++) {
							option = product['option'][j];
							
							html += '  - <small>' + option['name'] + ': ' + option['value'] + '</small><br />';
						}
					}
					
					html += '  </td>';
					html += '  <td class="text-left">' + product['model'] + '</td>';
					html += '  <td class="text-right">' + product['quantity'] + '</td>';
					html += '  <td class="text-right">' + product['price'] + '</td>';
					html += '  <td class="text-right">' + product['total'] + '</td>';
					html += '</tr>';
				}				
			}
			
			if (json['vouchers']) {
				for (i in json['vouchers']) {
					voucher = json['vouchers'][i];
					 
					html += '<tr>';
					html += '  <td class="text-left">' + voucher['description'] + '</td>';
					html += '  <td class="text-left"></td>';
					html += '  <td class="text-right">1</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '  <td class="text-right">' + voucher['amount'] + '</td>';
					html += '</tr>';	
				}	
			}
			
			var total_row = 0;
			
			for (i in json['totals']) {
				total = json['totals'][i];
				
				html += '<tr id="total-row' + total_row + '">';
				html += '  <td class="text-right" colspan="4">' + total['title'] + ':</td>';
				html += '  <td class="text-right">' + total['text'] + '</td>';
				html += '</tr>';
				
				total_row++;
			}
			
			$('#total').html(html);
			
			if (!json['products'] && !json['vouchers']) {
				html  = '<tr>';
				html += '  <td colspan="5" class="text-center"><?php echo $text_no_results; ?></td>';
				html += '</tr>';	
		
				$('#total').html(html);					
			}
			
			
			
		},	
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});

	// Totals	
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/products',
		type: 'post',
		data: $('#tab-payment input[type=\'text\'], #tab-payment input[type=\'hidden\'], #tab-payment input[type=\'radio\']:checked, #tab-payment input[type=\'checkbox\']:checked, #tab-payment select, #tab-payment textarea'),
		dataType: 'json',
		beforeSend: function() {
			//$('#button-payment i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			//$('#button-payment').prop('disabled', true);
		},
		complete: function() {
			//$('#button-payment i').replaceWith('<i class="fa fa-plus-circle"></i>');
			//$('#button-payment').prop('disabled', false);
		},
		success: function(json) {
			
		}
	});
});


$('#button-product-add').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/add',
		type: 'post',
		data: $('#tab-product input[type=\'text\'], #tab-product input[type=\'hidden\'], #tab-product input[type=\'radio\']:checked, #tab-product input[type=\'checkbox\']:checked, #tab-product select, #tab-product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-product-add i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-product-add').prop('disabled', true);
		},
		complete: function() {
			$('#button-product-add i').replaceWith('<i class="fa fa-plus-circle"></i>');
			$('#button-product-add').prop('disabled', false);
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
		
			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				
				if (json['error']['option']) {	
					for (i in json['error']['option']) {
						$('#input-option' + i).after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
					}
				}
									
				if (json['error']['stock']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['stock'] + '</div>');
				}
				
				if (json['error']['product']['store']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['store'] + '</div>');
				}	
															
				if (json['error']['minimum']) {	
					for (i in json['error']['minimum']) {
						$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['minimum'][i] + '</div>');
					}						
				}
			} else {
				refesh();
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});				
});

$('#button-product-remove').on('click', function() {
	var node = this;
	
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/remove',
		type: 'post',
		data: $('#tab-product input[type=\'text\'], #tab-product input[type=\'hidden\'], #tab-product input[type=\'radio\']:checked, #tab-product input[type=\'checkbox\']:checked, #tab-product select, #tab-product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-product-remove i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-product-remove').prop('disabled', true);
		},
		complete: function() {
			$('#button-product-remove i').replaceWith('<i class="fa fa-minus-circle"></i>');
			$('#button-product-remove').prop('disabled', false);
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
		
			// Check for errors
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			} else {
			
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});				
});

// Voucher
$('#button-voucher-add').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/voucher/add',
		type: 'post',
		data: $('#tab-voucher input[type=\'text\'], #tab-voucher input[type=\'hidden\'], #tab-voucher input[type=\'radio\']:checked, #tab-voucher input[type=\'checkbox\']:checked, #tab-voucher select, #tab-voucher textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-voucher-add i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-voucher-add').prop('disabled', true);
		},
		complete: function() {
			$('#button-voucher-add i').replaceWith('<i class="fa fa-plus-circle"></i>');
			$('#button-voucher-add').prop('disabled', false);
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
		
			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				
				if (json['error']['from_name']) {
					$('input[name=\'from_name\']').after('<div class="text-danger">' + json['error']['from_name'] + '</div');
				}	
				
				if (json['error']['from_email']) {
					$('input[name=\'from_email\']').after('<div class="text-danger">' + json['error']['from_email'] + '</div>');
				}	
							
				if (json['error']['to_name']) {
					$('input[name=\'to_name\']').after('<div class="text-danger">' + json['error']['to_name'] + '</div>');
				}	
				
				if (json['error']['to_email']) {
					$('input[name=\'to_email\']').after('<div class="text-danger">' + json['error']['to_email'] + '</div>');
				}	
				
				if (json['error']['amount']) {
					$('input[name=\'amount\']').after('<div class="text-danger">' + json['error']['amount'] + '</div>');
				}	
			} else {
				$('input[name=\'from_name\']').attr('value', '');	
				$('input[name=\'from_email\']').attr('value', '');	
				$('input[name=\'to_name\']').attr('value', '');
				$('input[name=\'to_email\']').attr('value', '');	
				$('textarea[name=\'message\']').attr('value', '');	
				$('input[name=\'amount\']').attr('value', '<?php echo addslashes($voucher_min); ?>');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});				
});

$('#button-voucher-remove').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/remove',
		type: 'post',
		data: $('#tab-product input[type=\'text\'], #tab-product input[type=\'hidden\'], #tab-product input[type=\'radio\']:checked, #tab-product input[type=\'checkbox\']:checked, #tab-product select, #tab-product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-voucher-remove i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-voucher-remove').prop('disabled', true);
		},
		complete: function() {
			$('#button-voucher-remove i').replaceWith('<i class="fa fa-minus-circle"></i>');
			$('#button-voucher-remove').prop('disabled', false);
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
		
			// Check for errors
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			} else {
			
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});				
});

$('#button-product').on('click', function() {
	
	//fa-arrow-right
	
	$('a[href=\'#tab-product\']').parent().removeClass('active');
	$('a[href=\'#tab-product\']').parent().addClass('disabled');
	$('#tab-product').removeClass('active');
	
	$('a[href=\'#tab-payment\']').parent().removeClass('disabled');
	$('a[href=\'#tab-payment\']').parent().addClass('active');
	$('#tab-payment').addClass('active');
	
		
});

				
// Payment Address
$('select[name=\'payment_address\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=sale/customer/address&token=<?php echo $token; ?>&address_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'payment_address\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},		
		success: function(json) {
			if (json != '') {	
				$('#tab-payment input[name=\'firstname\']').attr('value', json['firstname']);
				$('#tab-payment input[name=\'lastname\']').attr('value', json['lastname']);
				$('#tab-payment input[name=\'company\']').attr('value', json['company']);
				$('#tab-payment input[name=\'address_1\']').attr('value', json['address_1']);
				$('#tab-payment input[name=\'address_2\']').attr('value', json['address_2']);
				$('#tab-payment input[name=\'city\']').attr('value', json['city']);
				$('#tab-payment input[name=\'postcode\']').attr('value', json['postcode']);
				$('#tab-payment select[name=\'country_id\']').prop('value', json['country_id']);
				
				payment_zone_id = json['zone_id'];
				
				$('#tab-payment select[name=\'country_id\']').trigger('change');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

var payment_zone_id = '<?php echo $payment_zone_id; ?>';

$('#tab-payment select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=sale/order/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#tab-payment select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#tab-payment input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#tab-payment input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';

			if (json['zone']) {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == payment_zone_id) {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#tab-payment select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#tab-payment select[name=\'country_id\']').trigger('change');

$('#button-payment-address').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/payment/address',
		type: 'post',
		data: $('#tab-payment input[type=\'text\'], #tab-payment input[type=\'hidden\'], #tab-payment input[type=\'radio\']:checked, #tab-payment input[type=\'checkbox\']:checked, #tab-payment select, #tab-payment textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-address i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-payment-address').prop('disabled', true);
		},
		complete: function() {
			$('#button-payment-address i').replaceWith('<i class="fa fa-arrow-right"></i>');
			$('#button-payment-address').prop('disabled', false);
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
								
				if (json['error']['firstname']) {
					$('#tab-payment input[name=\'firstname\']').after('<div class="text-danger">' + json['error']['firstname'] + '</div');
				}					
				
				if (json['error']['lastname']) {
					$('#tab-payment input[name=\'lastname\']').after('<div class="text-danger">' + json['error']['lastname'] + '</div');
				}	
				
				if (json['error']['address_1']) {
					$('#tab-payment input[name=\'address_1\']').after('<div class="text-danger">' + json['error']['address_1'] + '</div');
				}
				
				if (json['error']['city']) {
					$('#tab-payment input[name=\'city\']').after('<div class="text-danger">' + json['error']['city'] + '</div');
				}
				
				if (json['error']['country']) {
					$('#tab-payment select[name=\'country_id\']').after('<div class="text-danger">' + json['error']['country'] + '</div');
				}	
				
				if (json['error']['zone']) {
					$('#tab-payment select[name=\'zone_id\']').after('<div class="text-danger">' + json['error']['zone'] + '</div');
				}	
				
				if (json['error']['custom_field']) {	
					for (i in json['error']['custom_field']) {
						$('#input-payment-custom-field' + i).after('<div class="text-danger">' + json['error']['custom_field'][i] + '</div>');
					}
				}
			} else {
				// Payment Methods
				$.ajax({
					url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/payment/methods',
					dataType: 'json',
					beforeSend: function() {
						$('#button-payment-address i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						$('#button-payment-address').prop('disabled', true);
					},
					complete: function() {
						$('#button-payment-address i').replaceWith('<i class="fa fa-arrow-right"></i>');
						$('#button-payment-address').prop('disabled', false);
					},
					success: function(json) {
						if (json['error']) {
							$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						} else {
							if (json['payment_methods']) {
								html = '<option value=""><?php echo $text_select; ?></option>';
								
								for (i in json['payment_methods']) {
									if (json['payment_methods'][i]['code'] == $('select[\'payment_method\']').val()) {
										html += '<option value="' + json['payment_methods'][i]['code'] + '" selected="selected">' + json['payment_methods'][i]['title'] + '</option>';
									} else {
										html += '<option value="' + json['payment_methods'][i]['code'] + '">' + json['payment_methods'][i]['title'] + '</option>';
									}		
								}
						
								$('select[name=\'payment\']').html(html);
							}						
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				
				$('a[href=\'#tab-cart\']').parent().removeClass('active');
				$('a[href=\'#tab-cart\']').parent().addClass('disabled');
				$('#tab-cart').removeClass('active');
				
				$('a[href=\'#tab-product\']').parent().removeClass('disabled');
				$('a[href=\'#tab-product\']').parent().addClass('active');
				$('#tab-product').addClass('active');				
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Shipping Address
$('select[name=\'shipping_address\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=sale/customer/address&token=<?php echo $token; ?>&address_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'shipping_address\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},		
		success: function(json) {
			if (json != '') {	
				$('#tab-shipping input[name=\'firstname\']').attr('value', json['firstname']);
				$('#tab-shipping input[name=\'lastname\']').attr('value', json['lastname']);
				$('#tab-shipping input[name=\'company\']').attr('value', json['company']);
				$('#tab-shipping input[name=\'address_1\']').attr('value', json['address_1']);
				$('#tab-shipping input[name=\'address_2\']').attr('value', json['address_2']);
				$('#tab-shipping input[name=\'city\']').attr('value', json['city']);
				$('#tab-shipping input[name=\'postcode\']').attr('value', json['postcode']);
				$('#tab-shipping select[name=\'country_id\']').prop('value', json['country_id']);
				
				shipping_zone_id = json['zone_id'];
			
				$('#tab-shipping select[name=\'country_id\']').trigger('change');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

var shipping_zone_id = '<?php echo $shipping_zone_id; ?>';

$('#tab-shipping select[name=\'country_id\']').on('change', function() {
	$.ajax({
		url: 'index.php?route=sale/order/country&token=<?php echo $token; ?>&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#tab-shipping select[name=\'country_id\']').after(' <i class="fa fa-circle-o-notch fa-spin"></i>');
		},
		complete: function() {
			$('.fa-spin').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#tab-shipping input[name=\'postcode\']').parent().parent().addClass('required');
			} else {
				$('#tab-shipping input[name=\'postcode\']').parent().parent().removeClass('required');
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone']) {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == shipping_zone_id) {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#tab-shipping select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#tab-shipping select[name=\'country_id\']').trigger('change');

$('#button-shipping-address').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/shipping/address',
		type: 'post',
		data: $('#tab-shipping input[type=\'text\'], #tab-shipping input[type=\'hidden\'], #tab-shipping input[type=\'radio\']:checked, #tab-shipping input[type=\'checkbox\']:checked, #tab-shipping select, #tab-shipping textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-address i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-shipping-address').prop('disabled', true);
		},
		complete: function() {
			$('#button-shipping-address i').replaceWith('<i class="fa fa-arrow-right"></i>');
			$('#button-shipping-address').prop('disabled', false);
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			// Check for errors
			if (json['error']) {
				if (json['error']['warning']) {
					$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error']['warning'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
								
				if (json['error']['firstname']) {
					$('#tab-shipping input[name=\'firstname\']').after('<div class="text-danger">' + json['error']['firstname'] + '</div');
				}					
				
				if (json['error']['lastname']) {
					$('#tab-shipping input[name=\'lastname\']').after('<div class="text-danger">' + json['error']['lastname'] + '</div');
				}	
				
				if (json['error']['address_1']) {
					$('#tab-shipping input[name=\'address_1\']').after('<div class="text-danger">' + json['error']['address_1'] + '</div');
				}
				
				if (json['error']['city']) {
					$('#tab-shipping input[name=\'city\']').after('<div class="text-danger">' + json['error']['city'] + '</div');
				}
				
				if (json['error']['country']) {
					$('#tab-shipping select[name=\'country_id\']').after('<div class="text-danger">' + json['error']['country'] + '</div');
				}	
				
				if (json['error']['zone']) {
					$('#tab-shipping select[name=\'zone_id\']').after('<div class="text-danger">' + json['error']['zone'] + '</div');
				}	
				
				if (json['error']['custom_field']) {	
					for (i in json['error']['custom_field']) {
						$('#input-shipping-custom-field' + i).after('<div class="text-danger">' + json['error']['custom_field'][i] + '</div>');
					}
				}
			} else {
				// Shipping Methods
				$.ajax({
					url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/shipping/methods',
					dataType: 'json',
					beforeSend: function() {
						$('#button-shipping-address i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						$('#button-shipping-address').prop('disabled', true);
					},
					complete: function() {
						$('#button-shipping-address i').replaceWith('<i class="fa fa-arrow-right"></i>');
						$('#button-shipping-address').prop('disabled', false);
					},
					success: function(json) {
						if (json['error']) {
							$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
						} else {
							// Shipping Methods
							html = '<option value=""><?php echo $text_select; ?></option>';
							
							if (json['shipping_methods']) {
								for (i in json['shipping_methods']) {
									html += '<optgroup label="' + json['shipping_methods'][i]['title'] + '">';
								
									if (!json['shipping_methods'][i]['error']) {
										for (j in json['shipping_methods'][i]['quote']) {
											if (json['shipping_methods'][i]['quote'][j]['code'] == $('select[\'shipping_method\']').val()) {
												html += '<option value="' + json['shipping_methods'][i]['quote'][j]['code'] + '" selected="selected">' + json['shipping_methods'][i]['quote'][j]['title'] + '</option>';
											} else {
												html += '<option value="' + json['shipping_methods'][i]['quote'][j]['code'] + '">' + json['shipping_methods'][i]['quote'][j]['title'] + '</option>';
											}
										}		
									} else {
										html += '<option value="" style="color: #F00;" disabled="disabled">' + json['shipping_method'][i]['error'] + '</option>';
									}
									
									html += '</optgroup>';
								}
							}
							
							$('select[name=\'shipping\']').html(html);	
						}
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				
				
				$('a[href=\'#tab-payment\']').parent().removeClass('active');
				$('a[href=\'#tab-payment\']').parent().addClass('disabled');
				$('#tab-payment').removeClass('active');
				
				$('a[href=\'#tab-shipping\']').parent().removeClass('disabled');
				$('a[href=\'#tab-shipping\']').parent().addClass('active');
				$('#tab-shipping').addClass('active');								
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});				
});

// Shipping Method
$('#button-shipping-method').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/shipping/method',
		type: 'post',
		data: $('select[name=\'shipping_method\'] option:selected'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-method i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-shipping-method').prop('disabled', true);	
		},	
		complete: function() {
			$('#button-shipping-method i').replaceWith('<i class="fa fa-refresh"></i>');
			$('#button-shipping-method').prop('disabled', false);
		},		
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				// Totals	
				$.ajax({
					url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/totals',
					dataType: 'json',
					beforeSend: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						//$('#button-payment').prop('disabled', true);
					},
					complete: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-plus-circle"></i>');
						//$('#button-payment').prop('disabled', false);
					},
					success: function(json) {				
						if (json['totals']) {
							var total_row = 0;	
							
							for (i in json['totals']) {
								total = json['totals'][i];
								
								html += '<tr id="total-row' + total_row + '">';
								html += '  <td class="text-right" colspan="4">' + total['title'] + ':</td>';
								html += '  <td class="text-right">' + total['text'] + '</td>';
								html += '</tr>';
								
								total_row++;
							}
						
							$('#total').html(html);
						} else {
							html  = '<tr>';
							html += '  <td colspan="5" class="text-center"><?php echo $text_no_results; ?></td>';
							html += '</tr>';	
					
							$('#total').html(html);	
						}
					},	
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		},	
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Payment Method
$('#button-payment-method').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/payment/method',
		type: 'post',
		data: $('select[name=\'payment_method\'] option:selected'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-method i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-payment-method').prop('disabled', true);	
		},	
		complete: function() {
			$('#button-payment-method i').replaceWith('<i class="fa fa-refresh"></i>');
			$('#button-payment-method').prop('disabled', false);
		},		
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			
				// Totals	
				$.ajax({
					url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/totals',
					dataType: 'json',
					beforeSend: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						//$('#button-payment').prop('disabled', true);
					},
					complete: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-plus-circle"></i>');
						//$('#button-payment').prop('disabled', false);
					},
					success: function(json) {				
						if (json['totals']) {
							var total_row = 0;	
							
							for (i in json['totals']) {
								total = json['totals'][i];
								
								html += '<tr id="total-row' + total_row + '">';
								html += '  <td class="text-right" colspan="4">' + total['title'] + ':</td>';
								html += '  <td class="text-right">' + total['text'] + '</td>';
								html += '</tr>';
								
								total_row++;
							}
						
							$('#total').html(html);
						} else {
							html  = '<tr>';
							html += '  <td colspan="5" class="text-center"><?php echo $text_no_results; ?></td>';
							html += '</tr>';	
					
							$('#total').html(html);	
						}
					},	
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		
});

// Coupon
$('#button-coupon').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/coupon',
		type: 'post',
		data: $('input[name=\'coupon\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-coupon i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-coupon').prop('disabled', true);	
		},	
		complete: function() {
			$('#button-coupon i').replaceWith('<i class="fa fa-refresh"></i>');
			$('#button-coupon').prop('disabled', false);
		},		
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				// Totals	
				$.ajax({
					url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/totals',
					dataType: 'json',
					beforeSend: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						//$('#button-payment').prop('disabled', true);
					},
					complete: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-plus-circle"></i>');
						//$('#button-payment').prop('disabled', false);
					},
					success: function(json) {				
						if (json['totals']) {
							var total_row = 0;	
							
							for (i in json['totals']) {
								total = json['totals'][i];
								
								html += '<tr id="total-row' + total_row + '">';
								html += '  <td class="text-right" colspan="4">' + total['title'] + ':</td>';
								html += '  <td class="text-right">' + total['text'] + '</td>';
								html += '</tr>';
								
								total_row++;
							}
						
							$('#total').html(html);
						} else {
							html  = '<tr>';
							html += '  <td colspan="5" class="text-center"><?php echo $text_no_results; ?></td>';
							html += '</tr>';	
					
							$('#total').html(html);	
						}
					},	
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		
});

// Voucher
$('#button-voucher').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/voucher',
		type: 'post',
		data: $('input[name=\'voucher\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-voucher i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-voucher').prop('disabled', true);	
		},	
		complete: function() {
			$('#button-voucher i').replaceWith('<i class="fa fa-refresh"></i>');
			$('#button-voucher').prop('disabled', false);
		},		
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				
				// Totals	
				$.ajax({
					url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/totals',
					dataType: 'json',
					beforeSend: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						//$('#button-payment').prop('disabled', true);
					},
					complete: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-plus-circle"></i>');
						//$('#button-payment').prop('disabled', false);
					},
					success: function(json) {				
						if (json['totals']) {
							var total_row = 0;	
							
							for (i in json['totals']) {
								total = json['totals'][i];
								
								html += '<tr id="total-row' + total_row + '">';
								html += '  <td class="text-right" colspan="4">' + total['title'] + ':</td>';
								html += '  <td class="text-right">' + total['text'] + '</td>';
								html += '</tr>';
								
								total_row++;
							}
						
							$('#total').html(html);
						} else {
							html  = '<tr>';
							html += '  <td colspan="5" class="text-center"><?php echo $text_no_results; ?></td>';
							html += '</tr>';	
					
							$('#total').html(html);	
						}
					},	
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		
});

// Reward
$('#button-reward').on('click', function() {
	$.ajax({
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/reward',
		type: 'post',
		data: $('input[name=\'reward\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-reward i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-reward').prop('disabled', true);	
		},	
		complete: function() {
			$('#button-reward i').replaceWith('<i class="fa fa-refresh"></i>');
			$('#button-reward').prop('disabled', false);
		},		
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			
				// Totals	
				$.ajax({
					url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/cart/totals',
					dataType: 'json',
					beforeSend: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
						//$('#button-payment').prop('disabled', true);
					},
					complete: function() {
						//$('#button-payment i').replaceWith('<i class="fa fa-plus-circle"></i>');
						//$('#button-payment').prop('disabled', false);
					},
					success: function(json) {				
						if (json['totals']) {
							var total_row = 0;	
							
							for (i in json['totals']) {
								total = json['totals'][i];
								
								html += '<tr id="total-row' + total_row + '">';
								html += '  <td class="text-right" colspan="4">' + total['title'] + ':</td>';
								html += '  <td class="text-right">' + total['text'] + '</td>';
								html += '</tr>';
								
								total_row++;
							}
						
							$('#total').html(html);
						} else {
							html  = '<tr>';
							html += '  <td colspan="5" class="text-center"><?php echo $text_no_results; ?></td>';
							html += '</tr>';	
					
							$('#total').html(html);	
						}
					},	
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		
});

// Affiliate
$('input[name=\'affiliate\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=marketing/affiliate/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				json.unshift({
					affiliate_id: 0,
					name: '<?php echo $text_none; ?>'
				});
								
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['affiliate_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'affiliate\']').val(item['label']);
		$('input[name=\'affiliate_id\']').val(item['value']);		
	}	
});

// Checkout
$('#button-save').on('click', function() {
	$.ajax({
		<?php if (!$order_id) { ?>
		url: 'index.php?route=sale/order/api&token=<?php echo $token; ?>&api=api/order/add',
		<?php } else { ?>
		url: 'index.php?route=sale/api/api&token=<?php echo $token; ?>&api=api/order/update&order_id=<?php echo $order_id; ?>',
		<?php } ?>
		type: 'post',
		data: $('select[name=\'order_status_id\'] option:selected, textarea[name=\'comment\'], input[name=\'affiliate_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-save i').replaceWith('<i class="fa fa-circle-o-notch fa-spin"></i>');
			$('#button-save').prop('disabled', true);	
		},	
		complete: function() {
			$('#button-save i').replaceWith('<i class="fa fa-check-circle"></i>');
			$('#button-save').prop('disabled', false);	
		},		
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['error']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			}
			
			if (json['success']) {
				$('#content > .container-fluid').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '  <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
			
			
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});		
});
//--></script> 
<?php echo $footer; ?>