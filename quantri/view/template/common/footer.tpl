<?php echo $shortcodes_script; ?>
<?php if ($pim_status) {?>
<script type="text/javascript">
// Power Image Manager
$(document).ready(function() {
  $(document).undelegate('a[data-toggle=\'image\']', 'click');
  // Power Image Manager
  $(document).delegate('a[data-toggle=\'image\']', 'click', function(e) {
    e.preventDefault();    
    var element = this;
    $(element).popover({
      html: true,
      placement: 'right',
      trigger: 'manual',
      content: function() {
        return '<button type="button" id="button-image" class="btn btn-primary"><i class="fa fa-pencil"></i></button> <button type="button" id="button-clear" class="btn btn-danger"><i class="fa fa-trash-o"></i></button>';
      }
    });
    location.hash = 'pim';
    $(element).popover('toggle');

    $('#button-image').on('click', function() {
      $(element).popover('hide');
      var target = $(element).parent().find('input').attr('id');
      var thumb = $(element).attr('id');
      var fm = $('<div/>').dialogelfinder({
        url : 'index.php?route=common/filemanager/connector&token=' + getURLVar('token'),
        lang : '<?php echo $lang;?>',
        width : <?php echo $width;?>,
        height: <?php echo $height;?>,
        destroyOnClose : true,
        
        uiOptions : {toolbar : [['home', 'back', 'forward'],['reload'],['mkdir', 'upload'],['open', 'download', 'getfile'],['info'],['quicklook'],['copy', 'cut', 'paste'],['rm'],['duplicate', 'rename', 'edit', 'resize'],['extract', 'archive','multiupload'],['search'],['view'],['help']]},
  
        contextmenu: {navbar: ["open", "|", "copy", "cut", "paste", "duplicate", "|", "rm", "|", "info"],cwd: ["reload", "back", "|", "upload", "mkdir", "mkfile", "paste", "|", "sort", "|", "info"],files: ["getfile", "|", "open", "quicklook", "|", "download", "|", "copy", "cut", "paste", "duplicate", "|", "rm", "|", "edit", "rename", "resize", "|", "archive","multiupload", "extract", "|", "info"]},
        
        getFileCallback : function(files, fm) {
          a = files.url;

          b = a.replace('<?php echo HTTPS_CATALOG."image/";?>',''); 
          b = b.replace('<?php echo HTTP_CATALOG."image/";?>','');  
          
          
          $('#'+thumb).find('img').attr('src', files.tmb);
          $('#'+target).val(decodeURIComponent(b));
          $('#radio-'+target).removeAttr('disabled');
          $('#radio-'+target).val(b);
        },
        commandsOptions : {
          getfile : {
            oncomplete : 'close',
          }
        }
      }).dialogelfinder('instance');
      return;
    });

    $('#button-clear').on('click', function() {
      $(element).find('img').attr('src', $(element).find('img').attr('data-placeholder'));
      $(element).parent().find('input').attr('value', '');
      $(element).popover('hide');
    });
  });

  $(document).delegate('a[data-toggle=\'manager\']', 'click', function(e) {
    e.preventDefault();
    var fm = $('<div/>').dialogelfinder({
      url : 'index.php?route=common/filemanager/connector&token=' + getURLVar('token'),
      lang : '<?php echo $lang;?>',
      width : <?php echo $width;?>,
      height: <?php echo $height;?>,
      destroyOnClose : true,
      
      uiOptions : {toolbar : [['home', 'back', 'forward'],['reload'],['mkdir', 'upload'],['open', 'download', 'getfile'],['info'],['quicklook'],['copy', 'cut', 'paste'],['rm'],['duplicate', 'rename', 'edit', 'resize'],['extract', 'archive','multiupload', 'sort'],['search'],['view'],['help']]},

      contextmenu: {navbar: ["open", "|", "copy", "cut", "paste", "duplicate", "|", "rm", "|", "info"],cwd: ["reload", "back", "|", "upload", "mkdir", "mkfile", "paste", "|", "sort", "|", "info"],files: ["getfile", "|", "open", "quicklook", "|", "download", "|", "copy", "cut", "paste", "duplicate", "|", "rm", "|", "edit", "rename", "resize", "|", "archive","multiupload", "extract", "|", "info"]},
      
      getFileCallback : function(files, fm) {
        a = files.url;
          b = a.replace('<?php echo HTTPS_CATALOG."image/";?>',''); 
          b = b.replace('<?php echo HTTP_CATALOG."image/";?>','');  
        addMultiImage(decodeURIComponent(b));
      },
      commandsOptions : {
        getfile : {
          oncomplete : 'close',
          folders : false
        }
      }
    }).dialogelfinder('instance');
  });

 $(document).undelegate('button[data-toggle=\'image\']', 'click');
 
    $(document).delegate('button[data-toggle=\'image\']', 'click', function() {
      location.hash = '';
      var fm = $('<div/>').dialogelfinder({
        url : 'index.php?route=common/filemanager/connector&token=' + getURLVar('token'),
        lang : '<?php echo $lang;?>',
        width : <?php echo $width;?>,
        height: <?php echo $height;?>,
        destroyOnClose : true,
        getFileCallback : function(files, fm) {
          var range, sel = window.getSelection();  
          if (sel.rangeCount) {
            var img = document.createElement('img');
            a = files.url;
            b = a.replace(files.baseUrl,'');
            img.src = files.baseUrl+''+b;
            range = sel.getRangeAt(0);
            range.insertNode(img);
          }
        },
        commandsOptions : {
          getfile : {
            oncomplete : 'close',
            folders : false
          }
        }
      }).dialogelfinder('instance');
    });
});
// Power Image Manager
<?php } ?>
</script>
<footer id="admin-footer">
  <?php echo $text_footer; ?><br />
</footer>
</div>
<div class="fixed-bottom">
  <ul class="list">
    <li class="item-content">
      <div class="item-title"> Hotline: <span class="title-child"></span> </div>
      <div class="item-description"> 01111.111.111 </div>
    </li>
    <li class="item-content">
      <div class="item-title"> CN Hà Nội: <span class="title-child"></span> </div>
      <div class="item-description"> (04) 2222.22.22 </div>
    </li>
    <li class="item-content">
      <div class="item-title"> CN HCM: <span class="title-child"></span> </div>
      <div class="item-description"> (08) 888.888.88 </div>
    </li>
  </ul>
</div>
<script type="text/javascript">
$("#column-left").mCustomScrollbar({
  axis: "y",
  
});
</script>
<script type="text/javascript">
var LHCChatOptions = {};
LHCChatOptions.opt = {widget_height:340,widget_width:300,popup_height:520,popup_width:500,domain:'website500k.com'};
(function() {
var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
var referrer = (document.referrer) ? encodeURIComponent(document.referrer.substr(document.referrer.indexOf('://')+1)) : '';
var location  = (document.location) ? encodeURIComponent(window.location.href.substring(window.location.protocol.length)) : '';
po.src = 'https://livechat.website500k.net/index.php/vnm/chat/getstatus/(click)/internal/(position)/bottom_left/(ma)/br/(top)/350/(units)/pixels/(leaveamessage)/true/(theme)/1?r='+referrer+'&l='+location;
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
</script>
</body></html>