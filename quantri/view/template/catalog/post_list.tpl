<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
	  <div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-post').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-bars"></i> <?php echo $text_list; ?></h3>
      </div>
	  
	  
	  
	  <div class="well">
          <div class="row">
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
			     
              </div>
            </div>
           <div class="col-sm-4">

           	<div class="form-group">
                <label class="control-label" for="input-thread">Danh mục tin tức</label>
                <!-- <input type="text" name="filter_thread" value="<?php echo $filter_thread; ?>" placeholder="Danh mục" id="input-thread" class="form-control" /> -->
                <select name="filter_thread" id="input-thread" class="form-control">
                  <option value=""></option>
                    <?php foreach ($threads as $key => $thread) { ?>
                      <option value="<?php echo $thread['thread_id'];?>" <?php echo ($filter_thread == $thread['thread_id'])? "selected":"" ?> ><?php echo $thread['name'];?></option>
                      <?php if($thread['children']) { ?>
                        <?php foreach ($thread['children'] as $key => $child) { ?>
                          <option value="<?php echo $child['thread_id'];?>" <?php echo ($filter_thread == $child['thread_id'])? "selected":"" ?> >         <?php echo $child['name'];?></option>
                        
                          <?php if($child['children']) { ?>
                            <?php foreach ($child['children'] as $key => $child2) { ?>
                              <option value="<?php echo $child2['thread_id'];?>" <?php echo ($filter_thread == $child2['thread_id'])? "selected":"" ?> >                  <?php echo $child2['name'];?></option>
                            <?php } ?>
                          <?php } ?>
                        <?php } ?>
                      <?php } ?>
                    <?php } ?>
                </select>
              </div>
              <!-- <div class="form-group">
                <label class="control-label" for="input-author"><?php echo "Select Author"; ?></label>
                <input type="text" name="author" value="<?php echo $author; ?>" placeholder="<?php echo "Select Author"; ?>" id="input-author" class="form-control" />
              			     <input type="hidden" name="filter_author" value="<?php echo $filter_author; ?>" />
              </div> -->
            </div>
            <div class="col-sm-4">
              <div class="form-group">
                <label class="control-label" for="input-status"><?php echo $entry_status; ?></label>
                <select name="filter_status" id="input-status" class="form-control">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!$filter_status && !is_null($filter_status)) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
			<div class="col-sm-4"> </div>
			  <div class="col-sm-4">  </div>
			 <div class="col-sm-4">
			<button type="button" id="button-filter" class="btn btn-primary pull-right"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button>
			  </div>
          </div>
        </div>
	  
	  

	  
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-post" class="form-horizontal">
          <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover">
			  <thead>
				<tr>
				  <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
				  <td class="text-center"><?php echo $column_image; ?></td>
				  
					<td class="text-left">
					<?php if ($sort == 'nd.title') { ?>
                    <a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_title; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_title; ?>"><?php echo $text_title; ?></a>
                    <?php } ?></td>
				  
				  <td class="text-left">
					<?php if ($sort == 'nd.short_description') { ?>
                    <a href="<?php echo $sort_short_description; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_short_description; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_short_description; ?>"><?php echo $text_short_description; ?></a>
                    <?php } ?>
				  
				  </td>
				  
				  <td class="text-left">
				  <?php if ($sort == 'nd.title') { ?>
                    <a href="<?php echo $sort_date; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_date; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_date; ?>"><?php echo $text_date; ?></a>
                    <?php } ?>
				  </td>
				   <td class="text-left">
					<?php if ($sort == 'nd.sort_order') { ?>
                    <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_sort_order; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_sort_order; ?>"><?php echo $text_sort_order; ?></a>
                    <?php } ?>
				  
				  </td>
				  <td class="text-left">
					<?php if ($sort == 'nd.status') { ?>
                    <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $text_status; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_status; ?>"><?php echo $text_status; ?></a>
                    <?php } ?>
				  </td>
				  <td class="text-right"><?php echo $text_action; ?></td>
				  
				
				  
				</tr>
			  </thead>
			  <tbody>
				<?php if ($posts) { ?>
				  <?php foreach ($posts as $post) { ?>
				  <tr>
					<td width="1" style="text-align: center;"><input type="checkbox" name="selected[]" value="<?php echo $post['post_id']; ?>" /></td>
					
					  <td class="text-center"><?php if ($post['image']) { ?>
                    <img src="<?php echo $post['image']; ?>" alt="<?php echo $post['title']; ?>" class="img-thumbnail" />
                    <?php } else { ?>
                    <span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
                    <?php } ?></td>
					<td class="text-left"><?php echo $post['title']; ?></td>
					<td class="text-left"><?php echo $post['short_description']; ?></td>
					<td class="text-left"><?php echo $post['date_added']; ?></td>
					<td class="text-left"><?php echo $post['sort_order']; ?></td>
					<td class="text-left"><?php echo $post['status']; ?></td>
					
					<td class="text-right">	
					<a href="<?php echo $post['edit']; ?>" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Edit"><i class="fa fa-pencil"></i></a>
					
					
					
					
					
					
					</td>
				  </tr>
				  <?php } ?>
				<?php } else { ?>
				  <tr>
					<td colspan="8" class="text-center"><?php echo $text_no_results; ?></td>
				  </tr>
				<?php } ?>
			  </tbody>
			</table>
          </div>
        </form>
		<div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
	<div style="text-align:center; color:#222222;">Advance post System v3.0.1 by <a target="_blank" href="http://www.marketinsg.com">MarketInSG</a></div>
  </div>
  



<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	//alert(url);
	var url = 'index.php?route=catalog/post&token=<?php echo $token; ?>';
	
	var filter_name = $('input[name=\'filter_name\']').val();
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var author = $('input[name=\'author\']').val();

	if (author) {
		url += '&filter_author=' + encodeURIComponent($('input[name=\'filter_author\']').val());
		url += '&author=' + encodeURIComponent($('input[name=\'author\']').val());
		
	}
	var filter_thread = $('select[name=\'filter_thread\']').val();

  if (filter_thread) {
    url += '&filter_thread=' + encodeURIComponent(filter_thread);
  }
	
	var filter_status = $('select[name=\'filter_status\']').val();

	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}

	location = url;
});
//---------------------------------------
// Related
$('input[name=\'filter_name\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/post/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['post_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'filter_name\']').val(item['label']);
	}
});


// Category
$('input[name=\'author\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/thread/autocomplete_user&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['thread_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'author\']').val(item['label']);
		$('input[name=\'filter_author\']').val(item['value']);
	}
});
</script>