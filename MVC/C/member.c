<?php
class member extends _Main
{
	/**
	 * 公共模块区
	 */
	function loadPage($viewName,$get_driverName)
	{
		/**
		 * 加载页面公共方法
		 */
		$this->setViewName($viewName);
	  	$this->addObject("hideTop",true);
	  	$this->addObject("hideFooter",true);
	  	
	  	$this->addObject("driverNames",$get_driverName);
	}
	function loadPlaces($tableName)
	{
		/**
	  	 * 加载起点终点表
	  	 */
	  	$m=load_model($tableName);
		$m->loadall();
		$this->addObject("places",$m->all());
	}
	function loadKinum($tableName)
	{
		/**
	  	 * 加载起点终点表
	  	 */
	  	$m=load_model($tableName);
		$m->loadall();
		$this->addObject("kinums",$m->all());
	}
	function loadCarnum($tableName)
	{
		/**
	  	 * 加载车数表
	  	 */
	  	$m=load_model($tableName);
		$m->loadall();
		$this->addObject("carnums",$m->all());
	}
	function loadUnpr($tableName)
	{
		/**
	  	 * 加载车数表
	  	 */
	  	$m=load_model($tableName);
		$m->loadall();
		$this->addObject("unprs",$m->all());
	}
	function loadDrvNum($tableName)
	{
		/**
	  	 * 加载车数表
	  	 */
	  	$m=load_model($tableName);
		$m->loadall();
		$this->addObject("numbers",$m->all());
	}
	function loadDetaileAll($tableName,$get_startPlace,$get_end_place)
	{
		/**
	  	 * 加载车数表
	  	 */
	  	$mAnd=load_model($tableName);
		$mAnd->loadAnd(" start_place='".$get_startPlace."' "," end_place='".$get_end_place."' ");
		
		$this->addObject("loadAndValue",$mAnd->all());
	}
	function loadDetaileSingle($tableName,$get_starPlace,$get_endPlace)
	{
		/**
		 * 加载司机信息明细表
		 * 取起点至卸点的ID
		 */
		$mAnd=load_model($tableName);
		$mAnd->loadAndSingle(" start_place='".$get_starPlace."' "," end_place='".$get_endPlace."' ");
 		return $get_id=$mAnd->id;
	}
	function loadDriverInfoID($tableName,$get_driverName)
	{
		/**
		 * 加载司机信息明细表
		 * 取起点至卸点的ID
		 */
		$m=load_model($tableName); //加载司机信息表
		$m->load(" driver_name='".$get_driverName."' ");
		return $id = $m->id;
	}
	
	/**
	 * 加载页面区
	 */
	function driverDUpdate()
	{
		$getUser=the_user();
		if(!isset($getUser->user_name))
		{
			exit("请登录之后在进行删除修改");
		}

		$get_startPlace=GET("startPlace");
		$get_endPlace=GET("endPlace");
		$get_carNum=GET("carNum");
		$get_kilometres=GET("kilometres");
		$get_unitPrice=GET("unitPrice");
		$get_amount=GET("amount");
		$get_bu_amount=GET("bu_amount");
		$get_remark=GET("remark");
		$get_driverName=GET("driverName");

	  	$this->addObject("startPlace",$get_startPlace);
	  	$this->addObject("endPlace",$get_endPlace);
	  	$this->addObject("carNum",$get_carNum);
	  	$this->addObject("kilometres",$get_kilometres);
	  	$this->addObject("unitPrice",$get_unitPrice);
	  	$this->addObject("amount",$get_amount);
	  	$this->addObject("bu_amount",$get_bu_amount);
	  	$this->addObject("remark",$get_remark);
	  	$this->addObject("driverName",$get_driverName);
	  	
	  	
		/**
		 * 修改明细方法
		 */ 
		$this->loadPage("driverDUpdate","");
	  	/**
	  	 * 1.加载起点终点表
	  	 * 2.加载公里数表
	  	 * 3.加载车数表
	  	 * 4.加载单价表
	  	 * 5.加载司机信息明细表
	  	 */
	  	$this->loadPlaces("place");
		$this->loadKinum("kinum");
		$this->loadCarnum("carnum");
		$this->loadUnpr("unpr");
		
		//$this->loadDetaileAll("detaile",$get_startPlace,$get_end_place);
	}
	function driverUnpi()
	{
		/**
		 * 添加单价
		 */
		$this->loadPage("driverUnpi","");
	}
	function driverkime()
	{
		/**
 		 * 添加公里数
 		 */
 		$this->loadPage("driverkime","");
	}
	function driverPlace()
	{
		/**
 		 * 添加地点
 		 */
 		$this->loadPage("driverPlace","");
	}
	function driverDetailAdd()
	{
		/**
 		 * 新增司机明细
 		 */
 		$this->loadPage("driverDetailAdd","");
 		
 		/**
 		 * 通过GET方式接收司机名字
 		 */
 		$get_driverName = $_GET['driver_name'];
 		$get_driverNum = $_GET['driver_num'];
 		
	  	
	  	/**
	  	 * 1.加载起点终点表
	  	 * 2.加载公里数表
	  	 * 3.加载车数表
	  	 * 4.加载单价表
	  	 */
	  	$this->loadPlaces("place");
		$this->loadKinum("kinum");
		$this->loadCarnum("carnum");
		$this->loadUnpr("unpr");
		
		/**
		 * 将司机名字通过GET传到前台
		 */
		$this->addObject("driverName",$get_driverName);
		$this->addObject("driverNum",$get_driverNum);
	}
 	function addDriver()
 	{
 		/**
 		 * 新增司机页
 		 */
 		$this->loadPage("addDriver","");
 		$this->loadDrvNum("number");
 	}
 	function deleteDriver()
 	{
 		$getUser=the_user();
		if(!isset($getUser->user_name))
		{
			exit("请登录之后在进行删除修改");
		}

 		/**
 		 * 删除司机页 
 		 */	
 		$get_driverName=GET("driver_name");
 		$get_carNum=GET("driver_num");
 		$this->loadPage("deleteDriver",$get_driverName);
 	}
 	function addImg()
 	{
 		/**
 		 * 加截图片前端页面
 		 */
 		$this->loadPage("addImg","");
 	}
 	
 	/**
 	 * 逻辑处理区
 	 */
 	function countAmountAction()
 	{
 		/**
 		 * 计算总金额
 		 */
 		$get_driverName=GET("driverName","post");
 		$get_carNum=GET("carNum","post");
 		$get_sumName=GET("sumName","post");
 		
 		/**
 		 * 加载用户名细表
 		 */
 		$m=load_model("detaile");
 	
 		$ret = $m->sumAmount($get_driverName,$get_sumName);
 		exit($ret);
 		
 	}
 	function driverUnpiAction()
 	{
 		/**
 		 * 新增单价
 		 */
 		$get_unitPrice=GET("unitPrice","post");

	   	if($get_unitPrice=="")
		{
			exit("要添加的单价不能为空");
		}
		
		$time = date("Y-m-d h:i:s");
		$m=load_model("unpr"); //加载司机信息表
		$ret=$m->_db->driver_unpr()->insert(array(
		"unit_price"=>$get_unitPrice,
		"create_time"=>$time
		)); 	
	
		exit("1");
 	}
 	function driverDAction()
	{
		/**
 		 * 新增司机明细
 		 */
 		$get_starPlace=GET("starPlace","post");
 		$get_endPlace=GET("endPlace","post");
 		$get_carNum=GET("carNum","post");
 		$get_kiloMetreNumber=GET("kiloMetreNumber","post");
 		$get_unitPrice=GET("unitPrice","post");
 		$get_amount=GET("amount","post");
 		$get_duamount=GET("duAmount","post");
 		$get_remark=GET("remark","post");
 		$get_driverName=GET("driverName","post");
 		$get_driverNum=GET("driverNum","post");
 		
 		if($get_starPlace=="")
		{
			exit("起点不能为空");
		}
		if($get_endPlace=="")
		{
			exit("卸点不能为空");
		}
		if($get_carNum=="")
		{
			exit("车数不能为空");
		}
		if($get_kiloMetreNumber=="")
		{
			exit("公里数不能为空");
		}
		if($get_unitPrice=="")
		{
			exit("单价不能为空");
		}
		if($get_amount == "")
		{
			exit("金额不能为空");
		}

		$time = date("Y-m-d h:i:s");
		$m=load_model("detaile"); //加载司机信息表
		$ret=$m->_db->driver_detaile()->insert(array(
			"driver_name"=>$get_driverName,
			"driver_num"=>$get_driverNum,
			"start_place"=>$get_starPlace,
			"end_place"=>$get_endPlace,
			"car_num"=>$get_carNum,
			"kilometres"=>$get_kiloMetreNumber,
			"unit_price"=>$get_unitPrice,
			"amount"=>$get_amount,
			"bu_amount"=>$get_duamount,
			"remark"=>$get_remark,
			"create_time"=>$time
		)); 
		exit("1");
		
	}
	function driverUDAction()
	{
		/**
 		 * 更新删除司机明细表
 		 */
 		$get_starPlace=GET("starPlace","post");
 		$get_endPlace=GET("endPlace","post");
 		$get_carNum=GET("carNum","post");
 		$get_kiloMetreNumber=GET("kiloMetreNumber","post");
 		$get_unitPrice=GET("unitPrice","post");
 		$get_amount=GET("amount","post");
 		$get_remark=GET("remark","post");
 		$get_driverName=GET("driverName","post");
 		$get_bu_amount=GET("bu_amount","post");
 		$get_updateDelete=GET("updateDelete","post");
 		
		$get_id=$this->loadDetaileSingle("detaile",$get_starPlace,$get_endPlace);
 		/**
 		 * 加载司机明细信息表
 		 */
 		$m=load_model("detaile");
 		if($get_updateDelete == "修改")
 		{
 			$insert_arr2 = array('driver_name'=>$get_driverName,
		 		'start_place'=>$get_starPlace,
		 		'end_place'=>$get_endPlace,
		 		'car_num'=>$get_carNum,
		 		'kilometres'=>$get_kiloMetreNumber,
		 		'unit_price'=>$get_unitPrice,
		 		'amount'=>$get_amount,
		 		'bu_amount'=>$get_bu_amount,
		 		'remark'=>$get_remark
	 		);//一条数据
			$ret = $m->update($get_id,$insert_arr2);
 		}
 		else if($get_updateDelete == "删除")
 		{	
 			$ret = $m->delete($get_id);
 		}
		exit("1");
	}
 	function driverkimeAction()
	{
		/**
 		 * 添加公里数
 		 */
		$get_inputKime=GET("inputKime","post");

	   	if($get_inputKime=="")
		{
			exit("地点名字不能为空");
		}
		
		$time = date("Y-m-d h:i:s");
		$m=load_model("kinum"); //加载司机信息表
		$ret=$m->_db->driver_kinum()->insert(array(
		"kilometre_number"=>$get_inputKime,
		"create_time"=>$time
		)); 	
	
		exit("1");
	}
 	function driverPlaceAction()
	{
		/**
 		 * 添加地点
 		 */
		$get_inputPlace=GET("inputPlace","post");

	   	if($get_inputPlace=="")
		{
			exit("地点名字不能为空");
		}
		
		$time = date("Y-m-d h:i:s");
		$m=load_model("place"); //加载司机信息表
		$ret=$m->_db->driver_place()->insert(array(
		"place_name"=>$get_inputPlace,
		"create_time"=>$time
		)); 	
	
		exit("1");
	}
 	function driverOterAction()
	{
		/**
 		 * 添加起点与卸点插入数据库
 		 */
		$get_startPlace=GET("starPlace","post");
		$get_endPlace=GET("endPlace","post");
		$get_kilometreNumber=GET("kilometreNumber","post");

	   	if($get_startPlace=="")
		{
			exit("起点不能为空");
		}
		if($get_endPlace=="")
		{
			exit("卸点不能为空");
		}
		if($get_kilometreNumber=="")
		{
			exit("公里数不能为空");
		}
		
		$time = date("Y-m-d h:i:s");
		$m=load_model("odometer"); //加载司机信息表
		$ret=$m->_db->driver_odometer()->insert(array(
		"star_place"=>$get_startPlace,
		"end_place"=>$get_endPlace,
		"kilometre_number"=>$get_kilometreNumber,
		"create_time"=>$time
		)); 	
	
		exit("1");
	}
 	function addImgAction()
 	{
 		/**
 		 * 上传图片
 		 */
		$file = $_FILES['images']['tmp_name'];
		$FileName = $_FILES['images']['name'];
		$filePath = dirname(__DIR__)."/V/v1/img/";
		
		if(move_uploaded_file($file,$filePath.$FileName)){
		   	$data = "{\"imgName\":\"$FileName\"}";
		   	exit($data);
		}else{
			$data = "{\"imgName\":\"error\"}";
		   	exit($data);
		}
 	}
 	function addDriverUpdate()
 	{
 		$get_driverName=GET("driverName","post");
 		$get_driverImg=GET("driverImg","post");
	   	$get_Img="/img/".$get_driverImg;
	   	
	   	if($get_driverName=="")
		{
			exit("司机名字不能为空");
		}
		if($get_Img == "")
		{
			exit("图片路径不能为空");
		}
		$insert_arr2 = array('driver_name'=>$get_driverName,'car_img'=>$get_Img);//一条数据
		
		$id = $this->loadDriverInfoID("infos",$get_driverName);
		$m = load_model("infos");
		$ret = $m->update($id,$insert_arr2);
		exit("1");
 	}
 	function addDriverAction()
 	{
 		$get_driverName=GET("driverName","post");
		$get_driverNum=GET("driverNumber","post");
		
		$get_driverImg=GET("driverImg","post");
	   	$get_Img="/img/".$get_driverImg;
	   	
	   	if($get_driverName=="")
		{
			exit("司机名字不能为空");
		}
		if($get_driverNum=="")
		{
			exit("车牌号不能为空");
		}
		
		$time = date("Y-m-d h:i:s");
		$m=load_model("infos"); //加载司机信息表
		$ret=$m->_db->driver_infos()->insert(array(
		"driver_name"=>$get_driverName,
		"car_num"=>$get_driverNum,
		"car_img"=>$get_Img,
		"create_time"=>$time
		)); 	
	
		exit("1");
 	}
 	function deleteDriverAction()
 	{
 		$get_driverName=GET("driverName","post");
		
		if($get_driverName=="")
		{
			exit("司机名字不能为空");
		}

		$count=load_model("detaile");
		$ret = $count->loadAndCount($get_driverName);
		if($ret > 0)
		{
			exit("该司机名下还有明细、请先删除司机明细");
		}
		/**
		 * 取司机信息表司机名字对应的ID
		 * 加载并删除对应ID的司机信息
		 */
		$id = $this->loadDriverInfoID("infos",$get_driverName);
		$m=load_model("infos");
		$ret = $m->delete($id);
		
		exit("1");
 	}
 	
}
?>