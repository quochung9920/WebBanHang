<?php foreach($result as $key=> $value) { ?>
    <div class="columns col-12 col-md-2 accordion-item-mobile">
        <div class="row accordion-content-mobile">
            <ul class="menu-group">
                <?php $this->listSubWithoutUl_Footer($value['id'], $key+1);?>
            </ul>
        </div>
    </div>
<?php } ?>
