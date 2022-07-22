<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-featured" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>




          <div class="form-group" style="display: flex; flex-wrap: wrap;">
            <?php foreach ($languages as $key_language => $language) { ?>
            <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php if($key_language == 'vi') echo $entry_title; ?></label>
            <div class="col-sm-10">
              <img style="position: absolute;" src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
              <input type="text" name="title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title[$language['language_id']]) ? $title[$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <div class="col-sm-12"><p> </p></div>
            <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
              <div id="featured-product" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($products as $product) { ?>
                <div id="featured-product<?php echo $product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product['name']; ?>
                  <input type="hidden" name="product[]" value="<?php echo $product['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>

          <div class="form-group" style="display: flex; flex-wrap: wrap;">
            <?php foreach ($languages as $key_language => $language) { ?>
            <label class="col-sm-2 control-label" for="input-title2<?php echo $language['language_id']; ?>"><?php if($key_language == 'vi') echo $entry_title; ?></label>
            <div class="col-sm-10">
              <img style="position: absolute;" src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
              <input type="text" name="title2[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title2[$language['language_id']]) ? $title2[$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title2<?php echo $language['language_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <div class="col-sm-12"><p> </p></div>
            <label class="col-sm-2 control-label" for="input-product2"><?php echo $entry_product; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product2" value="" placeholder="<?php echo $entry_product; ?>" id="input-product2" class="form-control" />
              <div id="featured-product2" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($products2 as $product2) { ?>
                <div id="featured-product2<?php echo $product2['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product2['name']; ?>
                  <input type="hidden" name="product2[]" value="<?php echo $product2['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>

          <div class="form-group" style="display: flex; flex-wrap: wrap;">
            <?php foreach ($languages as $key_language => $language) { ?>
            <label class="col-sm-2 control-label" for="input-title3<?php echo $language['language_id']; ?>"><?php if($key_language == 'vi') echo $entry_title; ?></label>
            <div class="col-sm-10">
              <img style="position: absolute;" src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" />
              <input type="text" name="title3[<?php echo $language['language_id']; ?>]" value="<?php echo isset($title3[$language['language_id']]) ? $title3[$language['language_id']] : ''; ?>" placeholder="<?php echo $entry_title; ?>" id="input-title3<?php echo $language['language_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <div class="col-sm-12"><p> </p></div>
            <label class="col-sm-2 control-label" for="input-product3"><?php echo $entry_product; ?></label>
            <div class="col-sm-10">
              <input type="text" name="product3" value="" placeholder="<?php echo $entry_product; ?>" id="input-product3" class="form-control" />
              <div id="featured-product3" class="well well-sm" style="height: 150px; overflow: auto;">
                <?php foreach ($products3 as $product3) { ?>
                <div id="featured-product3<?php echo $product3['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $product3['name']; ?>
                  <input type="hidden" name="product3[]" value="<?php echo $product3['product_id']; ?>" />
                </div>
                <?php } ?>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-limit"><?php echo $entry_limit; ?></label>
            <div class="col-sm-10">
              <input type="text" name="limit" value="<?php echo $limit; ?>" placeholder="<?php echo $entry_limit; ?>" id="input-limit" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_width; ?></label>
            <div class="col-sm-10">
              <input type="text" name="width" value="<?php echo $width; ?>" placeholder="<?php echo $entry_width; ?>" id="input-width" class="form-control" />
              <?php if ($error_width) { ?>
              <div class="text-danger"><?php echo $error_width; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-height"><?php echo $entry_height; ?></label>
            <div class="col-sm-10">
              <input type="text" name="height" value="<?php echo $height; ?>" placeholder="<?php echo $entry_height; ?>" id="input-height" class="form-control" />
              <?php if ($error_height) { ?>
              <div class="text-danger"><?php echo $error_height; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="panel panel-default hidden">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_banner_left; ?></h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-left"><?php echo $entry_banner_left; ?></label>
            <div class="col-sm-10"> <a href="" id="thumb-image-banner-left" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_left['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="banner_left[image]" value="<?php echo $banner_left['image']; ?>" placeholder="<?php echo $entry_banner_left; ?>" id="input-banner-left" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-left-width-height"><?php echo $entry_resolution; ?></label>
            <div class="col-sm-2">
              <input type="number" name="banner_left[width]" value="<?php echo $banner_left['width']; ?>" placeholder="<?php echo $entry_banner_left_width; ?>" id="input-banner-left-width" class="form-control" />
            </div>
            <div class="col-sm-2">
              <input type="number" name="banner_left[height]" value="<?php echo $banner_left['height']; ?>" placeholder="<?php echo $entry_banner_left_height; ?>" id="input-banner-left-height" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-left-link"><?php echo $entry_banner_left_link; ?></label>
            <div class="col-sm-10">
              <input type="text" name="banner_left[link]" value="<?php echo $banner_left['link']; ?>" placeholder="<?php echo $entry_banner_left_link; ?>" id="input-banner-left-link" class="form-control" />
            </div>
          </div>
        </div>
      </div>
      <div class="panel panel-default hidden">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_banner_right; ?></h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-right"><?php echo $entry_banner_right; ?></label>
            <div class="col-sm-10"> <a href="" id="thumb-image-banner-right" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_right['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="banner_right[image]" value="<?php echo $banner_right['image']; ?>" placeholder="<?php echo $entry_banner_right; ?>" id="input-banner-right" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-right-width-height"><?php echo $entry_resolution; ?></label>
            <div class="col-sm-2">
              <input type="number" name="banner_right[width]" value="<?php echo $banner_right['width']; ?>" placeholder="<?php echo $entry_banner_right_width; ?>" id="input-banner-right-width" class="form-control" />
            </div>
            <div class="col-sm-2">
              <input type="number" name="banner_right[height]" value="<?php echo $banner_right['height']; ?>" placeholder="<?php echo $entry_banner_right_height; ?>" id="input-banner-right-height" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-right-link"><?php echo $entry_banner_right_link; ?></label>
            <div class="col-sm-10">
              <input type="text" name="banner_right[link]" value="<?php echo $banner_right['link']; ?>" placeholder="<?php echo $entry_banner_right_link; ?>" id="input-banner-right-link" class="form-control" />
            </div>
          </div>
        </div>
      </div>
      <div class="panel panel-default hidden">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_banner_bottom1; ?></h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-bottom1"><?php echo $entry_banner_bottom1; ?></label>
            <div class="col-sm-10"> <a href="" id="thumb-image-banner-bottom1" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_bottom1['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="banner_bottom1[image]" value="<?php echo $banner_bottom1['image']; ?>" placeholder="<?php echo $entry_banner_bottom1; ?>" id="input-banner-bottom1" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-bottom1-width-height"><?php echo $entry_resolution; ?></label>
            <div class="col-sm-2">
              <input type="number" name="banner_bottom1[width]" value="<?php echo $banner_bottom1['width']; ?>" placeholder="<?php echo $entry_banner_bottom1_width; ?>" id="input-banner-bottom1-width" class="form-control" />
            </div>
            <div class="col-sm-2">
              <input type="number" name="banner_bottom1[height]" value="<?php echo $banner_bottom1['height']; ?>" placeholder="<?php echo $entry_banner_bottom1_height; ?>" id="input-banner-bottom1-height" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-bottom1-link"><?php echo $entry_banner_bottom1_link; ?></label>
            <div class="col-sm-10">
              <input type="text" name="banner_bottom1[link]" value="<?php echo $banner_bottom1['link']; ?>" placeholder="<?php echo $entry_banner_bottom1_link; ?>" id="input-banner-bottom1-link" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-bottom1-scale"><?php echo $entry_banner_bottom1_scale; ?></label>
            <div class="col-sm-10">
              <select name="banner_bottom1[scale]" id="input-banner-bottom1-scale" class="form-control">
                <option value="100%" <?php echo ($banner_bottom1['scale'] == '100%') ? 'selected' : ''; ?>>100%</option>
                <option value="50%" <?php echo ($banner_bottom1['scale'] == '50%') ? 'selected' : ''; ?>>50%</option>
              </select>
            </div>
          </div>
        </div>
      </div>
      <div class="panel panel-default hidden">
        <div class="panel-heading">
          <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_banner_bottom2; ?></h3>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-bottom2"><?php echo $entry_banner_bottom2; ?></label>
            <div class="col-sm-10"> <a href="" id="thumb-image-banner-bottom2" data-toggle="image" class="img-thumbnail"><img src="<?php echo $banner_bottom2['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
              <input type="hidden" name="banner_bottom2[image]" value="<?php echo $banner_bottom2['image']; ?>" placeholder="<?php echo $entry_banner_bottom2; ?>" id="input-banner-bottom2" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-bottom2-width-height"><?php echo $entry_resolution; ?></label>
            <div class="col-sm-2">
              <input type="number" name="banner_bottom2[width]" value="<?php echo $banner_bottom2['width']; ?>" placeholder="<?php echo $entry_banner_bottom2_width; ?>" id="input-banner-bottom2-width" class="form-control" />
            </div>
            <div class="col-sm-2">
              <input type="number" name="banner_bottom2[height]" value="<?php echo $banner_bottom2['height']; ?>" placeholder="<?php echo $entry_banner_bottom2_height; ?>" id="input-banner-bottom2-height" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-bottom2-link"><?php echo $entry_banner_bottom2_link; ?></label>
            <div class="col-sm-10">
              <input type="text" name="banner_bottom2[link]" value="<?php echo $banner_bottom2['link']; ?>" placeholder="<?php echo $entry_banner_bottom2_link; ?>" id="input-banner-bottom2-link" class="form-control" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-banner-bottom2-scale"><?php echo $entry_banner_bottom2_scale; ?></label>
            <div class="col-sm-10">
              <select name="banner_bottom2[scale]" id="input-banner-bottom2-scale" class="form-control">
                <option value="100%" <?php echo ($banner_bottom2['scale'] == '100%') ? 'selected' : ''; ?>>100%</option>
                <option value="50%" <?php echo ($banner_bottom2['scale'] == '50%') ? 'selected' : ''; ?>>50%</option>
              </select>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
  <script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	select: function(item) {
		$('input[name=\'product\']').val('');
		
		$('#featured-product' + item['value']).remove();
		
		$('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product[]" value="' + item['value'] + '" /></div>');	
	}
});
	
$('#featured-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});


$('input[name=\'product2\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['product_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'product2\']').val('');
    
    $('#featured-product2' + item['value']).remove();
    
    $('#featured-product2').append('<div id="featured-product2' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product2[]" value="' + item['value'] + '" /></div>');  
  }
});
  
$('#featured-product2').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});

$('input[name=\'product3\']').autocomplete({
  source: function(request, response) {
    $.ajax({
      url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
      dataType: 'json',
      success: function(json) {
        response($.map(json, function(item) {
          return {
            label: item['name'],
            value: item['product_id']
          }
        }));
      }
    });
  },
  select: function(item) {
    $('input[name=\'product3\']').val('');
    
    $('#featured-product3' + item['value']).remove();
    
    $('#featured-product3').append('<div id="featured-product3' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="product3[]" value="' + item['value'] + '" /></div>');  
  }
});
  
$('#featured-product3').delegate('.fa-minus-circle', 'click', function() {
  $(this).parent().remove();
});
//--></script></div>
<?php echo $footer; ?>