<?php /* @var $this Controller */ ?>
<?php $this->beginContent('/layouts/user'); ?>

<div class="user_right">
		<div class="user_right_menu">
			<ul id="validate_tab">
				<li class="title" >我要借款</li>
				<li><a href="<?php echo Yii::app()->baseUrl;?>/index.php?r=User/account">正在招标的借款</a></li>
				<li><a href="<?php echo Yii::app()->baseUrl;?>/index.php?r=User/account/bank">尚未发布的借款</a></li><li><a href="<?php echo Yii::app()->baseUrl;?>/index.php?r=User/account/rechargeLog">正在还款的借款</a></li>
				<li><a href="<?php echo Yii::app()->baseUrl;?>/index.php?r=User/account/recharge">担保的借款</a></li>
				
				<li><a href="<?php echo Yii::app()->baseUrl;?>/index.php?r=User/account/cash">投资者回复</a></li>
				<li><a href="<?php echo Yii::app()->createUrl('/User/borrowManager/credit') ?>">额度申请</a></li>
				
			</ul>
		</div>
		
		<div class="user_right_main">
		
				<!--content 开始-->
		<?php echo $content;?>
		<!--content 结束-->
		
		
		</div>
<!--用户中心的主栏目 结束-->
<div class="footer">
	<p> </p>

	<p><a href="http://www.miibeian.gov.cn/" target="_blank"></a></p>
	<p>众兴投资 Copyright 2011-2015</p>
</div>

</div>
<!-- sidebar -->
</div>
<?php $this->endContent(); ?>