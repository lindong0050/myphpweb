<?php 

// 通用web函数
function the_user() //获取当前登录用户
{
	if(isset($_COOKIE[User_LoginKey]))
	{
		$getcookie=myDecrypt($_COOKIE[User_LoginKey], UserLogin_CryptKey);
	 
	 	  	load_lib("user", "userinfo");
		  	$userinfo=new userinfo();
		  	$userinfo=unserialize($getcookie);
	 	 	//var_export($userinfo);
		  	//exit($userinfo->user_name);
		if($userinfo && $userinfo->user_name!="" && $userinfo->user_loginIP==IP())
		{
			//判断cookie的合法性
			return $userinfo;
		}
		return false;
	}
	return false;
}
function GET($pname,$method="get")
{
	$plist=$method=="get"?$_GET:$_POST;
	if(isset($plist[$pname]))
	{
	   	$getValue=trim($plist[$pname]);
	   	$getValue=strip_tags($getValue);//去除html和php 标记
	   	$getValue=addslashes($getValue);//单双引号、反斜线及NULL加上反斜线转义
	   	$getValue=str_replace(array("gcd"),"",$getValue);//过滤敏感字符
 
		return $getValue;
	}
	else
		return false;
}

function IP()
{
 
		if(!empty($_SERVER["HTTP_CLIENT_IP"])){
		  $cip = $_SERVER["HTTP_CLIENT_IP"];
		}
		elseif(!empty($_SERVER["HTTP_X_FORWARDED_FOR"])){
		  $cip = $_SERVER["HTTP_X_FORWARDED_FOR"];
		}
		elseif(!empty($_SERVER["REMOTE_ADDR"])){
		  $cip = $_SERVER["REMOTE_ADDR"];
		}
		else{
		  $cip = "";
		}
		return $cip;
	 
		 
 
}
function set_cache($key,$value,$expire)
{
	$m=new Memcache();
	$m->connect(Cache_IP,Cache_Port);
	$m->set($key,$value,0,$expire);
	
}
function get_cache($key)
{
	 //获取缓存
	$m=new Memcache();
	$m->connect(Cache_IP,Cache_Port);
	return $m->get($key);
}
function get_CookieCart() //封装方法 获取用户未登陆时的购物车
{
	$getCart=$_COOKIE[User_Cart_CookieKey];
				if($getCart)
				{
					$getCart=myDecrypt($getCart, User_Cart_CryptKey);
					
					if(!$getCart || trim($getCart)=="") return false;
				 
					return unserialize($getCart);
				}
				return false;
}
function load_model($mName,$dsn=DB_DSN)
{
	//加载一个模块
	return new _Model($mName,$dsn);
}

function load_lib($lib,$libName)
{
	//后缀必须是php
	require_once("Lib/".$lib."/".$libName.".php");
}

//加载 外部函数
require("crypt.php");//加密函数

?>