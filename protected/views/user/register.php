<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery validate表单验证插件制作注册表单验证提交</title>
<meta name="description" content="jquery validate表单验证插件制作用户注册页面表单提交验证，用户名、手机、密码、邮箱等表单验证。通过这款validate表单验证插件能制作多种表单提交验证。" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.validate.js"></script>
<script language="javascript" type="text/javascript" src="js/validate_expand.js"></script>
<script language="javascript" type="text/javascript" src="js/validate.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	initValidator();
});
</script>
</head>
<body>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif ,"宋体";}
/* demo */
.demo{width:600px;margin:50px auto 0 auto;}
.demo table td{height:50px;vertical-align:top;}
.demo table .tdcon{text-align:right;width:160px;padding:5px 0 0 0;height:45px;}
.demo table .stext{border:solid 1px #ddd;height:20px;line-height:20px;font-size:12px;padding:2px;width:200px;float:left;}
/* tipinfo */
.tipinfo{float:left;}
.tipinfo font.error{background:url("images/unchecked.jpg") no-repeat left;padding-left:17px;color:#eb0000;width:300px;display:block;}
.tipinfo font.valid{background:url("images/checked.gif") no-repeat left;width:14px;height:13px;overflow:hidden;padding:0;margin:5px 0 0 5px;display:inline-block;} 


/* Button base */
.Button{
	position:relative;
	display:inline-block;
	padding:.45em .825em .45em;
	text-align:center;
	line-height:1em; 
	border:1px solid transparent;
	cursor:pointer; 
	 
	border-radius:.3em; 
	-moz-border-radius:.3em; 
	-webkit-border-radius:.3em; 
	
	-moz-transition-property:color, -moz-box-shadow, text-shadow; 
	-moz-transition-duration:.05s; 
	-moz-transition-timing-function:ease-in-out; 
	-webkit-transition-property:color, -webkit-box-shadow, text-shadow; 
	-webkit-transition-duration:.05s; 
	-webkit-transition-timing-function:ease-in-out; 
	
	box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35); 
	-moz-box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35); 
	-webkit-box-shadow:0 1px rgba(255,255,255,0.8), inset 0 1px rgba(255,255,255,0.35);
}

.Button:hover {text-decoration:none;}
.Button strong {position:relative; z-index:2;}

.Button{
	display:block;border:1px solid;opacity:1;
	
	border-radius:.3em;
	-moz-border-radius:.3em;
	-webkit-border-radius:.3em;
	
	box-shadow:inset 0 1px rgba(255,255,255,0.35);
	-moz-box-shadow:inset 0 1px rgba(255,255,255,0.35);
	-webkit-box-shadow:inset 0 1px rgba(255,255,255,0.35);
	
	-moz-transition-property:opacity;
	-moz-transition-duration:0.5s;
	-moz-transition-timing-function:ease-in-out;
	-webkit-transition-property:opacity;
	-webkit-transition-duration:0.5s;
	-webkit-transition-timing-function:ease-in-out;
}

.Button:hover span{
	-moz-transition-property:opacity;
	-moz-transition-duration:0.05s;
	-moz-transition-timing-function:linear;
	-webkit-transition-property:opacity;
	-webkit-transition-duration:0.05s;
	-webkit-transition-timing-function:linear;
}
.Button:active span{
	-moz-transition:none;
	-webkit-transition:none;
}

/* Blue Button */
.BlueButton{color:#fcf9f9; text-shadow:0 -1px rgba(34,25,25,0.5);}
.BlueButton:hover {color:#fff; text-shadow:0 -1px rgba(34,25,25,0.3);}
.BlueButton:active {color:#f2f0f0; text-shadow:0 -1px rgba(34,25,25,0.6);}

.BlueButton{
	border-color:#015E91;
	background-color:#3693D5;
	background:-moz-linear-gradient(center top , #54B1EB, #47A0E0 50%, #419FE1 50%, #3683D5);
	background:-o-linear-gradient(top left, #54B1EB, #47A0E0 50%, #419FE1 50%, #3683D5);
	background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#54B1EB), to(#47A0E0), color-stop(.5,#419FE1),color-stop(.5,#3683D5));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#54B1EB', endColorstr='#3683D5');
}

.BlueButton:hover{
	border-color:#0366AD;
	background-color:#3EA1D6;
	background:-moz-linear-gradient(center top, #5EB4EA, #61A1EE 50%, #59A5EB 50%, #3691E6);
	background:-o-linear-gradient(top left, #5EB4EA, #61A1EE 50%, #59A5EB 50%, #3691E6);
	background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#5EB4EA), to(#61A1EE), color-stop(.5,#59A5EB),color-stop(.5,#3691E6));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5EB4EA', endColorstr='#3691E6');
}

.BlueButton:active{
	border-color:#013B6A;
	background-color:#3089C8;
	background:-moz-linear-gradient(center top, #4B9CDD, #4189D5 50%, #3D8BD3 50%, #3093C8);
	background:-o-linear-gradient(top left, #4B9CDD, #4189D5 50%, #3D8BD3 50%, #3093C8);
	background:-webkit-gradient(linear, 0% 0%, 0% 100%, from(#4B9CDD), to(#4189D5), color-stop(.5,#3D8BD3),color-stop(.5,#3093C8));
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4B9CDD', endColorstr='#3093C8');
}

.BlueButton.Button18:hover{
	box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
	-moz-box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
	-webkit-box-shadow:0 1px rgba(255, 255, 255, 0.8), 0 1px rgba(255, 255, 255, 0.35) inset, 0 0 10px rgba(82, 162, 235, 0.25);
}
.BlueButton.Button18:active{
	box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
	-moz-box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);
	-webkit-box-shadow:0 1px 2px rgba(34, 25, 25, 0.25) inset, 0 0 3px rgba(82, 202, 235, 0.35);	
} 
</style>

<div class="demo">
	<form id="registerForm" method="post" action="">
	<table width="100%">
        	<tr>
			<td class="tdcon">邮箱：</td>
			<td>
				<input class="stext" type='text' name="User[email]" id="email" value="" />
				<div class="tipinfo"></div>
			</td>
		</tr>
    
        
		<tr>
			<td class="tdcon">会员登录名：</td>
			<td>
				<input class="stext" type='text' name="User[username]" id="username" value="" />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">密码：</td>
			<td>
				<input class="stext" type="password" name="User[password]" id="passWord" value="" />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">再次输入密码：</td>
			<td>
				<input class="stext" type='password' name="passWordAgain" id="passWordAgain" value="" />
				<div class="tipinfo"></div>
			</td>
		</tr>
        <tr>
			<td class="tdcon">真实姓名：</td>
			<td>
				<input class="stext" type='text' name="User[realname]" id="realname" value="" />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">公司名称：</td>
			<td>
				<input class="stext" type='text' name="corpName" id="corpName" value="" />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">手机号码：</td>
			<td>
				<input class="stext" type='text' name="sms" id="sms" value="" />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td class="tdcon">邮编：</td>
			<td>
				<input class="stext" type='text' name="User[email]" id="email" value="" />
				<div class="tipinfo"></div>
			</td>
		</tr>
		<tr>
			<td></td>
			<td><button name="Submit" type="submit" class="Button BlueButton Button18">同意以下服务条款并注册</button></td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>