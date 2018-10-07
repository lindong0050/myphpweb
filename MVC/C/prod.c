<?php
 class prod extends _Main
 {
 
	function detail() //商品详细页
	{
 		$pid=intval($_GET["pid"]);
 		if($pid<=0) exit("没有该商品");
 		 
 		 $prod=load_model("prod");
 		 $prod->loadall(" * "," id=".$pid." and prod_ispub=1");
 		 $this->addObject("proddetail",$prod->all());
 		 $this->setViewName("prod");

	}
	function initcart()
	{
	 	$getUser=the_user();
		if(!$getUser) //用户没有登录情况，计入cookie
		{
			$getCart=get_CookieCart();
			if($getCart)
			{
				echo "document.getElementById('cartNum').innerHTML=".count($getCart).";";
			}
		}
		else
		{
			//代表用户已经登陆，从memcache获取
			$getCacheCart=get_cache(User_Cart_CacheKey.the_user()->user_name);
			if($getCacheCart) echo "document.getElementById('cartNum').innerHTML=".count($getCacheCart).";";
		}
		exit();
	}
	function addtocart()
	{
		//setcookie(User_Cart_CookieKey,"",time()-3600,"/",User_LoginDomain);
		//加入购物车处理代码
		$getUser=the_user();
		$getPid=intval($_POST["pid"]);
		if($getPid<=0) exit("0");
		if(!$getUser) //用户没有登录情况，计入cookie
		{
			$getCart=$_COOKIE[User_Cart_CookieKey];
			if($getCart)
			{
				$getCart=myDecrypt($getCart, User_Cart_CryptKey);
				if(!$getCart || trim($getCart)=="") exit("0");//说明cookie被破坏
				$getCart=unserialize($getCart);
				//var_export($getCart);
				if(!in_array($getPid,$getCart))
				{
					$getCart[]=$getPid;
					setcookie(User_Cart_CookieKey,
				myCrypt(serialize($getCart), User_Cart_CryptKey),
				time()+3600*24,"/",User_LoginDomain);
				}
				exit(strval(count($getCart)));//返回 最终的购物车商品数量
			}
			else //没有加入过购物车，则初始化
			{
				setcookie(User_Cart_CookieKey,
				myCrypt(serialize(array($getPid)), User_Cart_CryptKey),
				time()+3600*24,"/",User_LoginDomain);
				exit("1");//返回一个商品（数量)
			}
		}
		else
		{
			//当用户登陆的时候，购物车是放到memcache里的
			$getCacheCart=get_cache(User_Cart_CacheKey.the_user()->user_name);
			if(!$getCacheCart) $getCacheCart=array();
			if(!in_array($getPid, $getCacheCart))
				$getCacheCart[]=$getPid;
			
		    set_cache(User_Cart_CacheKey.the_user()->user_name, $getCacheCart, 3600);
			exit(strval(count($getCacheCart)));
		}
	} 
}
?>