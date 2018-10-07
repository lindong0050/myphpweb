<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>顺辉公司代运费结算系统</title>

<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/fileinput.min.css" rel="stylesheet" />
<link href="/fonts/glyphicons-halflings-regular.ttf" rel="stylesheet" />
<link href="/css/jquery.dataTables.min.css" rel="stylesheet" />
<link href="/css/showDialog.css" rel="stylesheet" />
</head>
<body>
<?php if(!$hideTop):?>
<script src="/js/jquery_211.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/fileinput.min.js"></script>
<script src="/js/jquery.dataTables.min.js"></script>
<script src="/js/showDialog.js"></script>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
				<?php
				   $getUser=the_user();
				 ?>
				 <?php if($getUser):?>
				<div class="navbar-header">
					 <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">切换导航</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="/index/getindex/">顺辉公司代运费结算系统</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					
					<ul class="nav navbar-nav">
						<li class="active">
							<a href="#" onclick='showWindow("添加司机","/member/addDriver/",800)'>添加司机</a>
						</li class="active">
						<li class="active">
							<a href="#" onclick='showWindow("添加卡车图片","/member/addImg/",800)'>更新卡车图片</a>
						</li>

						<li class="active">
							<a href="#" onclick='showWindow("添加地点","/member/driverPlace/",800)'>添加地点名</a>
						</li>
						<li class="active">
							<a href="#" onclick='showWindow("添加公里数","/member/driverkime/",800)'>添加公里数</a>
						</li>
						<li class="active">
							<a href="#" onclick='showWindow("添加单价","/member/driverUnpi/",800)'>添加单价</a>
						</li>
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="#" >欢迎您：<?php echo $getUser->user_name;?></a>
						</li>
					 	<li>
							  <a href="#" onclick='showWindow("注销退出","/index/unlogin/",500)'>安全退出</a>
						</li>
					 	<?php else:?>
					 	<div class="navbar-header">
					 		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> <span class="sr-only">切换导航</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button> <a class="navbar-brand" href="/index/login/">顺辉公司代运费结算</a>
						</div>
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">
					 	<!--<li>
							<a href="#" onclick='showWindow("会员登录","/index/login/",500)' >登录</a>
						</li>
						<li class="dropdown">
							<a href="#" onclick='showWindow("会员登录","/index/reg/",500)' >注册</a>
						</li>
						</ul>-->
					</ul>
				</div>
				 <?php endif;?>
			</nav>
		</div>
	</div>
</div>
<?php endif;?>