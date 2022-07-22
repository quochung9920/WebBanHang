<?php //print_r($menus); ?>
<div class="navbar yamm navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" class="navbar-toggle">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <!--<a href="#" class="navbar-brand">Yamm Megamenu</a>!-->
    </div>
    <div id="navbar-collapse-1" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($menus as $menu1) { ?>

        <?php if (isset($menu1['children'])) { ?>

        <?php if($menu1['style']=='' || $menu1['style']=='dropdown'){ ?>
        <li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle" aria-expanded="false"><?php echo $menu1['title']; ?> <b class="caret"></b></a>
          <ul role="menu" class="dropdown-menu">
            <?php foreach ($menu1['children'] as $menu2) { ?>
            <?php if(isset($menu2['children'])){ ?>
            <li>
              <a href="<?php echo $menu2['url']; ?>">
                <?php echo $menu2['title']; ?>
                <?php if($menu2['image']){ ?><img src="<?php echo $menu2['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                <?php if($menu2['font']){ ?><i class="font <?php echo $menu2['font']; ?>"></i><?php } ?>
              </a>
              <?php foreach ($menu2['children'] as $menu3) { ?>
              <ul class="dropdown-submenu">
              <?php if(isset($menu3['children'])){ ?>
              <li>
                <a href="<?php echo $menu3['url']; ?>">
                  <?php echo $menu3['title']; ?>
                  <?php if($menu3['image']){ ?><img src="<?php echo $menu3['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                  <?php if($menu3['font']){ ?><i class="font <?php echo $menu3['font']; ?>"></i><?php } ?>
                </a>
                <?php foreach ($menu3['children'] as $menu4) { ?>
                <ul class="dropdown-submenu">
                  <?php if(isset($menu4['children'])){ ?>
                  <?php }else{ ?>
                  <li>
                    <a href="<?php echo $menu4['url']; ?>">
                      <?php echo $menu4['title']; ?>
                      <?php if($menu4['image']){ ?><img src="<?php echo $menu4['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                      <?php if($menu4['font']){ ?><i class="font <?php echo $menu4['font']; ?>"></i><?php } ?>
                    </a>
                  </li>
                  <?php } ?>
                </ul>
                <?php } ?>
              </li>
              <?php }else{ ?>
              <li>
                <a href="<?php echo $menu3['url']; ?>">
                  <?php echo $menu3['title']; ?>
                  <?php if($menu3['image']){ ?><img src="<?php echo $menu3['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                  <?php if($menu3['font']){ ?><i class="font <?php echo $menu3['font']; ?>"></i><?php } ?>
                </a>
              </li>
              <?php } ?>
              </ul>
              <?php } ?>
            </li>
            <?php }else{ ?>
            <li>
              <a href="<?php echo $menu2['url']; ?>">
                <?php echo $menu2['title']; ?>
                <?php if($menu2['image']){ ?><img src="<?php echo $menu2['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                <?php if($menu2['font']){ ?><i class="font <?php echo $menu2['font']; ?>"></i><?php } ?>
              </a>
            </li>
            <?php } ?>
            <?php } ?>
          </ul>
        </li>
        <?php } ?>
        <?php if($menu1['style']=='lists'){ ?>
        <li class="dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle" aria-expanded="false"><?php echo $menu1['title']; ?> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li>
              <div class="yamm-content">
                <div class="row">
                <?php foreach ($menu1['children'] as $menu2) { ?>
                  <ul class="col-sm-2 list-unstyled">
                    <li>
                      <a href="<?php echo $menu2['url']; ?>">
                        <h4><?php echo $menu2['title']; ?></h4>
                        <?php if($menu2['image']){ ?><img src="<?php echo $menu2['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                        <?php if($menu2['font']){ ?><i class="font <?php echo $menu2['font']; ?>"></i><?php } ?>
                      </a>
                    </li>
                    <?php if(isset($menu2['children'])){ ?>
                    <?php foreach ($menu2['children'] as $menu3) { ?>
                    <li>
                      <a href="<?php echo $menu3['url']; ?>">
                        <?php echo $menu3['title']; ?>
                        <?php if($menu3['image']){ ?><img src="<?php echo $menu3['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                        <?php if($menu3['font']){ ?><i class="font <?php echo $menu3['font']; ?>"></i><?php } ?>
                      </a>
                    </li>
                    <?php } ?>
                    <?php } ?>
                  </ul>
                <?php } ?>
                </div>
              </div>
            </li>
          </ul>
        </li>
        <?php } ?>
        <?php if($menu1['style']=='tabbed'){ ?>
        <li class="dropdown yamm-fw"><a href="#" data-toggle="dropdown" class="dropdown-toggle" aria-expanded="false"><?php echo $menu1['title']; ?> <b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li>
              <div class="yamm-content">
                <div class="row">
                
                  <div id="tabbable" class="tabbable">
                    <ul class="nav nav-pills nav-stacked col-md-2">
                      <?php $activeTab = 0; ?>
                      <?php while($activeTab < 3) { ?>
                      <?php foreach ($menu1['children'] as $menu2) { ?>
                      <li <?php if($activeTab==0){ ?>class="active"<?php } ?>><a href="#<?php echo $menu2['id']; ?>" data-toggle="tab" data-parent="#tabbable" ><?php echo $menu2['title']; ?></a></li>
                      <?php $activeTab++; ?>
                      <?php } ?>
                      <?php } ?>
                    </ul>
                    <div class="tab-content col-md-10">
                      <?php $activePane = 0; ?>
                      <?php while($activePane < 3) { ?>
                      <?php foreach ($menu1['children'] as $menu2) { ?>
                      <div class="tab-pane <?php if($activePane==0){ ?>active<?php } ?>" id="<?php echo $menu2['id']; ?>">
                          <?php if(isset($menu2['children'])){ ?>
                          <?php foreach ($menu2['children'] as $menu3) { ?>
                          <ul class="col-sm-3 list-unstyled pull-left">
                            <li>
                              <a href="<?php echo $menu3['url']; ?>">
                                <h4><?php echo $menu3['title']; ?></h4>
                                <?php if($menu3['image']){ ?><img src="<?php echo $menu3['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                                <?php if($menu3['font']){ ?><i class="font <?php echo $menu3['font']; ?>"></i><?php } ?>
                              </a>
                            </li>
                            <?php if(isset($menu3['children'])){ ?>
                            <?php foreach ($menu3['children'] as $menu4) { ?>
                            <li>
                              <a href="<?php echo $menu4['url']; ?>" <?php if($menu4['window']){ ?>target="<?php echo $menu4['window']; ?>"<?php } ?>>
                              <?php echo $menu4['title']; ?>
                              <?php if($menu4['image']){ ?><img src="<?php echo $menu4['thumb']; ?>" class="img-thumbnail" /><?php } ?>
                              <?php if($menu4['font']){ ?><i class="font <?php echo $menu4['font']; ?>"></i><?php } ?>
                              </a>
                            </li>
                            <?php } ?>
                            <?php } ?>
                          </ul>
                          <?php } ?>
                          <?php } ?>
                      </div>
                      <?php $activePane++; ?>
                      <?php } ?>
                      <?php } ?>
                    </div>
                  </div>

                </div>
              </div>
            </li>
          </ul>
        </li>
        <?php } ?>

        <?php } else { ?>
        <li>
          <a href="<?php echo $menu1['url']; ?>" <?php if($menu1['window']){ ?>target="<?php echo $menu1['window']; ?>"<?php } ?>>
          <?php echo $menu1['title']; ?>
          <?php if($menu1['image']){ ?><img src="<?php echo $menu1['thumb']; ?>" class="img-thumbnail" /><?php } ?>
          <?php if($menu1['font']){ ?><i class="font <?php echo $menu1['font']; ?>"></i><?php } ?>
          </a>
        </li>
        <?php } ?>

        <?php } ?>
      </ul>
    </div>
  </div>
</div>
    <script>
      $(function() {
        window.prettyPrint && prettyPrint()
        $(document).on('click', '.navbar .dropdown-menu', function(e) {
          e.stopPropagation()
        })
      })
    </script>