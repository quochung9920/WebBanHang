<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-setting" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-setting" class="form-horizontal">
          <ul class="nav nav-tabs" id="language">
            <?php foreach ($languages as $language) { ?>
            <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
            <?php } ?>
          </ul>
          <div class="tab-content">
            <?php foreach ($languages as $language) { ?>
            <?php $language_id = $language['language_id']; ?>
            <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-name-<?php echo $language_id; ?>"><?php echo $entry_name; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_name[<?php echo $language_id; ?>]" value="<?php echo $config_name[$language_id]; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name-<?php echo $language_id; ?>" class="form-control" />
                  <?php if ($error_name) { ?>
                  <div class="text-danger"><?php echo $error_name; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-owner-<?php echo $language_id; ?>"><?php echo $entry_owner; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_owner[<?php echo $language_id; ?>]" value="<?php echo $config_owner[$language_id]; ?>" placeholder="<?php echo $entry_owner; ?>" id="input-owner-<?php echo $language_id; ?>" class="form-control" />
                  <?php if ($error_owner) { ?>
                  <div class="text-danger"><?php echo $error_owner; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-address-<?php echo $language_id; ?>"><?php echo $entry_address; ?></label>
                <div class="col-sm-10">
                  <textarea name="config_address[<?php echo $language_id; ?>]" placeholder="<?php echo $entry_address; ?>" rows="5" id="input-address-<?php echo $language_id; ?>" class="form-control"><?php echo $config_address[$language_id]; ?></textarea>
                  <?php if ($error_address) { ?>
                  <div class="text-danger"><?php echo $error_address; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-geocode-<?php echo $language_id; ?>"><span data-toggle="tooltip" data-container="#tab-general" title="<?php echo $help_geocode; ?>"><?php echo $entry_geocode; ?></span></label>
                <div class="col-sm-10">
                  <input type="text" name="config_geocode[<?php echo $language_id; ?>]" value="<?php echo $config_geocode[$language_id]; ?>" placeholder="<?php echo $entry_geocode; ?>" id="input-geocode-<?php echo $language_id; ?>" class="form-control" />
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-email-<?php echo $language_id; ?>"><?php echo $entry_email; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_email[<?php echo $language_id; ?>]" value="<?php echo $config_email[$language_id]; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email-<?php echo $language_id; ?>" class="form-control" />
                  <?php if ($error_email) { ?>
                  <div class="text-danger"><?php echo $error_email; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group required">
                <label class="col-sm-2 control-label" for="input-telephone-<?php echo $language_id; ?>"><?php echo $entry_telephone; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_telephone[<?php echo $language_id; ?>]" value="<?php echo $config_telephone[$language_id]; ?>" placeholder="<?php echo $entry_telephone; ?>" id="input-telephone-<?php echo $language_id; ?>" class="form-control" />
                  <?php if ($error_telephone) { ?>
                  <div class="text-danger"><?php echo $error_telephone; ?></div>
                  <?php } ?>
                </div>
              </div>
              <div class="form-group">
                <label class="col-sm-2 control-label" for="input-fax-<?php echo $language_id; ?>"><?php echo $entry_fax; ?></label>
                <div class="col-sm-10">
                  <input type="text" name="config_fax[<?php echo $language_id; ?>]" value="<?php echo $config_fax[$language_id]; ?>" placeholder="<?php echo $entry_fax; ?>" id="input-fax-<?php echo $language_id; ?>" class="form-control" />
                </div>
              </div>
            </div>
            <?php } ?>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#language a:first').tab('show');
//--></script>
<?php echo $footer; ?> 