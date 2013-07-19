<div class="notification png_bg">
				<div>
		<a href="<?php echo Yii::app()->baseUrl; ?>/index.php?r=admin/account">【账户信息】</a>
        <a href="<?php echo Yii::app()->baseUrl; ?>/index.php?r=admin/account/rechargeLog">【充值记录】</a>
       <a href="<?php echo Yii::app()->baseUrl; ?>/index.php?r=admin/account/cash">【申请提现】</a>
        <a href="<?php echo Yii::app()->baseUrl; ?>/index.php?r=admin/account/cash">【提现成功】</a>
        <a href="<?php echo Yii::app()->baseUrl; ?>/index.php?r=admin/account/">【添加充值】</a>
        <a href="<?php echo Yii::app()->baseUrl; ?>/index.php?r=admin/account">【扣除费用】</a>
				</div>
			</div>  
<!--- user list -->
<?php $this->widget('zii.widgets.grid.CGridView', array(
    'id' => 'account-list',
    'cssFile' => Yii::app()->baseUrl . '/css/grid_view.css',
    'dataProvider' => $model->search(),
    'filter' => $model,
    //'htmlOptions'=>array('stytle'=>'textalgin:center'),
    'columns' => array(
        array(
            'header' => 'ID',
            'type' => 'raw',
            'value' => '$data->id',
            ),
        //'sex',
        array(
            'header' => '用户',
            'name' => 'username',
            'value' => '$data->user->username'),

        array(
            'header' => '真实姓名',
            'name' => 'realname',
            'value' => '$data->user->realname'),
        array(
            'header' => '总余额',
            'name' => 'total',
            'value' => '$data->total'),
        array(
            'header' => '可用余额',
            'name' => 'use_money',
            'value' => '$data->use_money'),
        array(
            'header' => '冻结金额',
            'name' => 'no_use_money',
            'value' => '$data->no_use_money'),
        array(
            'header' => '待收金额',
            'name' => 'collection',
            'value' => '$data->collection'),


        ),
    )); ?>