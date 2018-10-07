<?php
include("my.conf"); //加载配置文件
require("Common/functions.php"); //加载全站 函数文件
require("MVC/C/_Main.c");//加载control主文件
require("MVC/M/_Model.m");//加载ModelDB主文件

$get_control=isset($_GET["control"])?trim($_GET["control"]):"index";
$get_action=isset($_GET["action"])?trim($_GET["action"]):"index";

if(file_exists("MVC/C/".$get_control.".c"))
{
	require("MVC/C/".$get_control.".c");
	$control=new $get_control();
	if( method_exists ($control,$get_action))
	{
		$getClass=new ReflectionClass($control);
		$getMethod=$getClass->getMethod($get_action);
		if($getMethod)
		{
			$control->$get_action();
			$control->run();
		}
		else
		{
			exit("找不到该页");
		}	
	}
}
?>