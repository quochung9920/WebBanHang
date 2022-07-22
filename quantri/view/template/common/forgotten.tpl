<?php echo $header; ?>
<div id="content">
  <div class="container-fluid"><br />
    <br />
    <div class="row">
      <div class="col-sm-offset-4 col-sm-4">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h1 class="panel-title"><i class="fa fa-repeat"></i> <?php echo $heading_title; ?></h1>
          </div>
          <div class="panel-body">
            <?php if ($error_warning) { ?>
            <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
              <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
            <?php } ?>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                  <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
                  <button type="submit" class="btn btn-primary btn-submit"><i class="fa fa-check"></i> <?php echo $button_reset; ?></button>
                </div>
              </div>
              <div class="text-right">
                <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="company-address">
  <h2>Công ty TNHH Thương mại điện tử Cao Tốc</h2>
  <p>Văn Phòng TP.HCM: 54/8A Nguyễn Bỉnh Khiêm, Q.1, TP.HCM | Tel: (08) 629.113.27 | Email : sales@website500k.com</p>
  <p>Văn Phòng HN: Số 44 ngõ 36 Đào Tấn, Ba Đình, HN | Tel: (04) 6670.33.88 | Email : saleshn@website500k.com</p>
</div>
<div class="fixed-bottom">
  <ul class="list">
    <li class="item-content">
      <div class="item-title"> Hotline: <span class="title-child"></span> </div>
      <div class="item-description"> 01239.500.500 </div>
    </li>
    <li class="item-content">
      <div class="item-title"> CN Hà Nội: <span class="title-child"></span> </div>
      <div class="item-description"> (04) 6670.33.88 </div>
    </li>
    <li class="item-content">
      <div class="item-title"> CN HCM: <span class="title-child"></span> </div>
      <div class="item-description"> (08) 629.113.27 </div>
    </li>
  </ul>
</div>