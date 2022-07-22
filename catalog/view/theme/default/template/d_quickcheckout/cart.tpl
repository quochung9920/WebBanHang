<!-- 
	Ajax Quick Checkout 
	v6.0.0
	Dreamvention.com 
	d_quickcheckout/cart.tpl 
-->
<div id="cart_view" class="qc-step" data-col="<?php echo $col; ?>" data-row="<?php echo $row; ?>"></div>
<script type="text/html" id="cart_template">

	<div class="panel panel-default <%= model.config.display ? '' : 'hidden' %>">
		<div class="panel-heading">
			<h4 class="panel-title">
				<span class="icon">
					<i class="<%= model.config.icon %>"></i>
				</span>
				<span class="text"><%= model.config.title %></span>
			</h4>
		</div>

		<div class="qc-checkout-product panel-body" >
			<% if(model.config.description){ %><p class="text"><%= model.config.description %></p><% } %>
			<% if(model.error){ %>
				<div class="alert alert-danger">
					<i class="fa fa-exclamation-circle"></i> <%= model.error %>
				</div>
			<% } %>
			<div class="table-responsive table_responsive_checkout_cart">
			<table class="table table-bordered qc-cart table_checkout_cart">
				<thead>
					<tr>
						<td class="qc-image <%= parseInt(model.config.columns.image) ? '' : 'hidden' %>" style="width: 12%"><?php echo $column_image; ?></td>
						<td class="qc-name <%= parseInt(model.config.columns.name) ? '' : 'hidden' %>" style="width: 30%"><?php echo $column_name; ?></td>
						<td class="qc-model hidden-xs <%= parseInt(model.config.columns.model) ? '' : 'hidden' %>"><?php echo $column_model; ?></td>
						<td class="qc-quantity <%= parseInt(model.config.columns.quantity) ? '' : 'hidden' %>" style="width: 30%"><?php echo $column_quantity; ?></td>
						<td class="qc-price hidden-xs <%= parseInt(model.config.columns.price) && model.show_price ? '' : 'hidden' %>" style="width: 14%"><?php echo $column_price; ?></td>
						<td class="qc-total <%= parseInt(model.config.columns.total) && model.show_price ? '' : 'hidden' %>" style="width: 14%"><?php echo $column_total; ?></td>
					</tr>
				</thead>

				<tbody>
					<% _.each(model.products, function(product) { %>
					<tr <%= product.stock ? '' : 'class="stock"' %>>
						<td class="qc-image <%= parseInt(model.config.columns.image) ? '' : 'hidden' %>">
							<a  href="<%= product.href %>" data-container="body" data-toggle="popover" data-placement="top" data-content='<img src="<%= product.image %>" />' data-trigger="hover">
								<img src="<%= product.thumb %>" class="img-responsive"/>
							</a>
						</td>

						<td class="qc-name <%= parseInt(model.config.columns.name) ? '' : 'hidden' %>">
							<a href="<%= product.href %>" <%=  model.config.columns.image ? '' : 'rel="popup" data-help=\'<img src="' + product.image + '"/>\'' %>> 
								<%= product.name %> <%= product.stock ? '' : '<span class="out-of-stock">***</span>' %>
							</a>
							<% _.each(product.option, function(option) { %>
								<div> &nbsp;<small> - <%= option.name %>: <%= option.value %></small> </div>
							<% }) %>
							<% if(parseInt(model.config.columns.model)){ %>
								<div class="qc-name-model visible-xs-block"><small><span class="title"><?php echo $column_model; ?>:</span> <span class="text"><%= product.model %></span></small></div>
							<% } %>
							<% if(parseInt(model.config.columns.price) && model.show_price){ %>
								<div class="qc-name-price visible-xs-block "><small><span class="title"><?php echo $column_price; ?>:</span> <span class="text"><%= product.price %></span></small></div>
							<% } %>
							<% if (product.reward) { %>
								<div><small><%= product.reward %></small></div>
							<% } %>
							<% if (product.recurring) { %>
								<div><span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><%= product.recurring %></small></div>
							<% } %>
						</td>

						<td class="qc-model hidden-xs <%= parseInt(model.config.columns.model) ? '' : 'hidden' %>"><%= product.model %></td>
						
						<td class="qc-quantity <%= parseInt(model.config.columns.quantity) ? '' : 'hidden' %>">
							<div class="input-group input-group-sm">
								<span class="input-group-btn">
									<button class="btn btn-primary decrease" data-product="<%= product.key %>"><i class="fa fa-chevron-down"></i></button>
								</span>            
								<input type="number" min="1" value="<%= product.quantity %>" class="qc-product-qantity form-control text-center" name="cart.<%= product.key %>"  data-refresh="2"/>
								<span class="input-group-btn">
									<button class="btn btn-primary increase" data-product="<%= product.key %>"><i class="fa fa-chevron-up"></i></button>
								
									<button class="btn btn-danger delete" data-product="<%= product.key %>"><i class="fa fa-times"></i></button>
								</span>
							</div>
						</td>

						<td class="qc-price hidden-xs <%= parseInt(model.config.columns.price) && model.show_price  ? '' : 'hidden' %>"><%= product.price %></td>
						<td class="qc-total <%= parseInt(model.config.columns.total) && model.show_price  ? '' : 'hidden' %>"><%= product.total %></td>
					</tr>
					<% }) %>
					<% _.each(model.vouchers, function(voucher) { %>
			        <tr>
			          <td class="qc-image <%= parseInt(model.config.columns.image) ? '' : 'hidden' %> "></td>
			          <td class="qc-name <%= parseInt(model.config.columns.name) ? '' : 'hidden' %> "><%= voucher.description %></td>
			          <td class="qc-model <%= parseInt(model.config.columns.model) ? '' : 'hidden' %> "></td>
			          <td class="qc-quantity <%= parseInt(model.config.columns.quantity) ? '' : 'hidden' %> ">1</td>
			          <td class="qc-price <%= parseInt(model.config.columns.price) && model.show_price ? '' : 'hidden' %> "><%= voucher.amount %></td>
			          <td class="qc-total <%= parseInt(model.config.columns.total) && model.show_price ? '' : 'hidden' %> "><%= voucher.amount %></td>
			        </tr>
			        <% }) %>
					
				</tbody>
			</table>
			</div>
			
			<div class="form-horizontal">
				<div class=" form-group qc-coupon <%= parseInt(model.config.option.coupon.display) ? '' : 'hidden' %>">
					<% if(model.errors.coupon){ %>
						<div class="col-sm-12">
							<div class="alert alert-danger">
								<i class="fa fa-exclamation-circle"></i> <%= model.errors.coupon %>
							</div>
						</div>
					<% } %>
					<% if(model.successes.coupon){ %>
						<div class="col-sm-12">
							<div class="alert alert-success">
								<i class="fa fa-exclamation-circle"></i> <%= model.successes.coupon %>
							</div>
						</div>
					<% } %>
					<label class="col-sm-4 control-label" >
						<?php echo $text_use_coupon; ?>
					</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" value="<%= model.coupon ? model.coupon : '' %>" name="coupon" id="coupon" <% if(Number(config.design.placeholder)) {  %>placeholder="<?php echo $text_use_coupon; ?>" <% } %>  class="form-control box-input-1"/>
							<span class="input-group-btn">
								<button class="btn btn-primary" id="confirm_coupon" type="button"><i class="fa fa-check"></i></button>
							</span>
						</div>
					</div>
					<% _.each(model.coupon, function(voucher) { %>
			        
			        <% }) %>
				</div>



				
				



				<div class=" form-group qc-voucher <%= parseInt(model.config.option.voucher.display) ? '' : 'hidden' %>">
					<% if(model.errors.voucher){ %>
						<div class="col-sm-12">
							<div class="alert alert-danger">
								<i class="fa fa-exclamation-circle"></i> <%= model.errors.voucher %>
							</div>
						</div>
					<% } %>
					<% if(model.successes.voucher){ %>
						<div class="col-sm-12">
							<div class="alert alert-success">
								<i class="fa fa-exclamation-circle"></i> <%= model.successes.voucher %>
							</div>
						</div>
					<% } %>

					<label class="col-sm-4 control-label" >
						<?php echo $text_use_voucher; ?>
					</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" value="<%= model.voucher ? model.voucher : '' %>" name="voucher" id="voucher" <% if(Number(config.design.placeholder)) {  %>placeholder="<?php echo 'Nhập lần lượt các mã vào đây'; //$text_use_voucher; ?>" <% } %>  class="form-control box-input-1"/>
							<span class="input-group-btn">
								<button class="btn btn-primary" id="confirm_voucher" type="button"><i class="fa fa-check"></i></button>
							</span>
						</div>
					</div>
				</div>
				<?php if($reward_points) {?>
				<div class=" form-group qc-reward <%= parseInt(model.config.option.reward.display) ? '' : 'hidden' %>">
					<% if(model.errors.reward){ %>
						<div class="col-sm-12">
							<div class="alert alert-danger">
								<i class="fa fa-exclamation-circle"></i> <%= model.errors.reward %>
							</div>
						</div>
					<% } %>
					<% if(model.successes.reward){ %>
						<div class="col-sm-12">
							<div class="alert alert-success">
								<i class="fa fa-exclamation-circle"></i> <%= model.successes.reward %>
							</div>
						</div>
					<% } %>
					<label class="col-sm-4 control-label" >
						<?php echo $text_use_reward; ?>
					</label>
					<div class="col-sm-8">
						<div class="input-group">
							<input type="text" value="<%= model.reward ? model.reward : '' %>" name="reward" id="reward" <% if(Number(config.design.placeholder)) {  %>placeholder="<?php echo $text_use_reward; ?>" <% } %> class="form-control box-input-1"/>
							<span class="input-group-btn">
								<button class="btn btn-primary" id="confirm_reward" type="button"><i class="fa fa-check"></i></button>
							</span>

						</div>
						<small><?php echo $entry_reward; ?></small>
					</div>

				</div>
				<?php } ?>
			</div>
			<% if(model.show_price){ %>
			<div class="form-horizontal qc-totals">
				<% _.each(model.totals, function(total) { %>
				<div class="row">
					<label class="col-sm-9 col-xs-6 control-label" ><%= total.title %></label>
					<div class="col-sm-3 col-xs-4 form-control-static text-right">
						<% if (total.text != 'Liên hệ') { %>
							<span><%= total.text %></span>
						<% } %>
					</div>
				</div>
				<% }) %>
			</div>
			<% } %>
			<div class="preloader row"><img class="icon" src="image/<%= config.general.loader %>" /></div>
		
		</div>
	</div>

</script>
<script>
$(function() {
	qc.cart = $.extend(true, {}, new qc.Cart(<?php echo $json; ?>));
	qc.cartView = $.extend(true, {}, new qc.CartView({
		el:$("#cart_view"), 
		model: qc.cart, 
		template: _.template($("#cart_template").html())
	}));

});

function label_esteemgift_click($this) {
	if($this.find('#esteemgift_tmp').prop('checked')){
		$('.esteemgift_slide').slideDown();
	}else{
		$('.esteemgift_slide').slideUp();
	}
}

function updateTextView(_obj){
  	var num = getNumber(_obj.val());
    _obj.val(num.toLocaleString('vi-VN'));
}
function getNumber(_str){
  var arr = _str.split('');
  var out = new Array();
  for(var cnt=0;cnt<arr.length;cnt++){
    if(isNaN(arr[cnt])==false){
      out.push(arr[cnt]);
    }
  }
  return Number(out.join(''));
}

</script>