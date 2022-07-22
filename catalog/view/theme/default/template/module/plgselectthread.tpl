<div class="col-sm-12 post">
  <div class="row">
    <div class="box-title">
      <h3><?php echo $heading_title; ?></h3>
    </div>
    <div class="panel-body">
      <div class="panel row" >
        <?php if(!$showsubthread){ ?>
        <?php foreach($datapost as $post){ ?>
        <div class="news-layout news-standard col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="image"> <a href="<?php echo $post['href']; ?>"> <img src="<?php echo $post['image']; ?>" alt="<?php echo $post['title']; ?>" title="<?php echo $post['title']; ?>" class="img-responsive" /> </a>
            <div class="news-date"><?php echo $post['date_added']; ?></div>
          </div>
          <div class="caption">
            <h2><a href="<?php echo $post['href']; ?>"><?php echo $post['title']; ?></a></h2>
            <h4><?php echo $post['short_description']; ?></h4>
            <div class="view-more"><a href="<?php echo $post['href']; ?>"><?php echo $text_see_more; ?></a></div>
          </div>
        </div>
        <?php } ?>
        <?php }else{ ?>
        <ul class="nav nav-tabs news-tabs">
          <?php foreach($children_data as $key => $value){ ?>
          <li> <a href="#news-tab-<?php echo $key; ?>" data-toggle="tab"><?php echo $value['name']; ?></a> </li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <?php foreach($children_data as $key => $value){ ?>
          <div class="tab-pane" id="news-tab-<?php echo $key; ?>">
            <div class="row">
              <?php foreach($value['datapost'] as $post){ ?>
              <div class="news-layout news-standard col-lg-4 col-md-4 col-sm-6 col-xs-12">
                <div class="image"> <a href="<?php echo $post['href']; ?>"> <img src="<?php echo $post['image']; ?>" alt="<?php echo $post['title']; ?>" title="<?php echo $post['title']; ?>" class="img-responsive" /> </a>
                  <div class="news-date"><?php echo $post['date_added']; ?></div>
                </div>
                <div class="caption">
                  <h2><a href="<?php echo $post['href']; ?>"><?php echo $post['title']; ?></a></h2>
                  <h4><?php echo $post['short_description']; ?></h4>
                  <div class="view-more"><a href="<?php echo $post['href']; ?>"><?php echo $text_see_more; ?></a></div>
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
          <?php } ?>
        </div>
        <?php } ?>
      </div>
    </div>
  </div>
</div>
<div class="clearfix"></div>
<script type="text/javascript">
$('.news-tabs a:first').tab('show');
</script>
