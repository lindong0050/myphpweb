<?php
 class index extends _Main
 {
	function getindex()
	{
	 	/**
	 	 * 加载主页
	 	 */
	 	$this->setViewName("index");
	 	$this->addObject("hideTop",false);
		$this->addObject("hideFooter",false);
	
		//$this->addObject("info",$m->all());
	}
	function getIndexDetail()
	{
		$m=load_model("infos"); //加载用户 表
		$m->loadall();

		$res = $m->all();

		foreach ($res as $key => $value) {
			$id=$value['id'];
			$driverName=$value['driver_name'];
			$car_num=$value['car_num'];
			$create_time=$value['create_time'];
			$row = array(
			"id"=>$id,
		    "名字" => $driverName,
		    "车牌号" => $car_num,
		    "添加时间" => $create_time,
			"查看详细" => "<a href='/index/driverDetail/?driver_name=$driverName&driver_num=$car_num'>查看详细</a>",
			"删除司机" => "<a href='#' onclick='showWindow(\"修改明细\",\"/member/deleteDriver/?driver_name=$driverName\",800)''>删除司机</a>"
			);
			$data['data'][] = $row;
		}
		shuffle($data['data']);
		exit(json_encode($data));
	}
	function driverDetail()
	{
 		/**
 		 * 司机明细页
 		 */
 		header("Content-Type:text/html;charset=UTF-8");
		$get_driverName=GET("driver_name");
	  	$get_driverCarNum=GET("driver_num");
	  	
	  	/**
	  	 * 加载司机表
	  	 */
		$this->addObject("driverName",$get_driverName);
		$this->addObject("driverNum",$get_driverCarNum);
		
 		$this->setViewName("driverDetail");
	  	$this->addObject("hideTop",false);
	  	$this->addObject("hideFooter",false);
	}
	function getDriverDetail()
	{
		header("Content-Type:text/html;charset=UTF-8");
		$get_driverName=GET("driverName");
	  	$get_driverCarNum=GET("driverNum");

	  	/**
	  	 * 加载司机表
	  	 */		
		$m=load_model("detaile"); //加载用户 表
		$m->loadAllWhere($get_driverName,$get_driverCarNum);
		$res = $m->all();

		foreach ($res as $key => $value) {
			$id=$value['id'];
			$driverName=$value['driver_name'];
			$startPlace=$value['start_place'];
			$endPlace=$value['end_place'];
			$carNum=$value['car_num'];
			$kilometres=$value['kilometres'];
			$unitPrice=$value['unit_price'];
			$amount=$value['amount'];
			$bu_amount=$value['bu_amount'];
			$remark=$value['remark'];
			$row = array(
			"id"=>$id,
		    "名字" => $driverName,
		    "开始地点" => $startPlace,
		    "卸点" => $endPlace,
		    "车数" => $carNum,
		    "公里数" => $kilometres,
		    "单价" => $unitPrice,
		    "金额" => $amount,
		    "应扣金额" => $bu_amount,
			"备注" => $remark,
			"修改与删除" => "<a href='#' onclick='showWindow(\"修改明细\",\"/member/driverDUpdate/?startPlace=$startPlace&endPlace=$endPlace&carNum=$carNum&kilometres=$kilometres&unitPrice=$unitPrice&amount=$amount&bu_amount=$bu_amount&remark=$remark&driverName=$driverName\",800)'>删除与修改</a>"
			);
			$data['data'][] = $row;
		}
		shuffle($data['data']);
		exit(json_encode($data));
	}
	function login()
 	{
 	  	$this->setViewName("login");
	  	$this->addObject("hideTop",false);
	  	$this->addObject("hideFooter",false);
 	}
	function unlogin()
	{
		$this->setViewName("unlogin");
		$this->addObject("hideTop",true);
	    $this->addObject("hideFooter",true);
		$this->addObject("REFERER",$_SERVER["HTTP_REFERER"]);
		setcookie(User_LoginKey, "", time()-3600,"/",User_LoginDomain);
	}
	function loginAction()
	{
		$get_username=GET("username","post");
		$get_userpass=GET("userpass","post");
		$get_remweek=intval($_POST["rem"]);
		if($get_username=="" || $get_userpass=="")
		{
			exit("用户名或密码不能为空");
		}
	  	$m=load_model("userlogin"); //加载用户 表
	  	$m->load(" user_name='".$get_username."' ");
	  	$get_db_pass=$m->user_pass;
		  
		if($get_db_pass && myDecrypt($get_db_pass,User_CryptKey)==$get_userpass)
		{
			load_lib("user", "userinfo");//加载 用户登录信息 类
		  	$userinfo=new userinfo();
		  	$userinfo->user_name=$get_username;
		  	$userinfo->user_regtime=$m->user_regtime;
		  	$userinfo->user_loginIP=IP();
		  	$userinfo->user_logintime=strtotime(date('Y-m-d h:i:s'));//登录时间戳
		 
		  	$cookie_string=myCrypt(serialize($userinfo), UserLogin_CryptKey) ;
		  	$cooktime=$get_remweek>0?time()+3600*24*7:0;
		  	setcookie(User_LoginKey, $cookie_string, $cooktime,"/",User_LoginDomain);
		 	//$this->mergeCart($get_username);
			exit("1");
		}
		else{
		  	exit("用户名或密码不正确");
		}
	}
 }
?>