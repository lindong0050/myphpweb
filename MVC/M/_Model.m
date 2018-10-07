<?php

 class _Model
 {
 	var $_modelName="";
	var $_db=false;
	var $_result=false;
	var $_dsn;
 	function _Model($mName,$dsn=DB_DSN)
	{
		$this->_dsn=$dsn;
		//$mName 暂时代表 数据表名  譬如 传入 user ，不用加前缀
		if($dsn==DB_DSN)
		  $this->_modelName=DB_Prefix."_".$mName; // user=> shop_user
		else
		   $this->_modelName=$mName;
		$this->modelInit();//初始化NotOrm  这一步是必须的
	}
	function modelInit()
	{
	load_lib("db","NotORM");
		//m的初始化 
		$structure = new NotORM_Structure_Convention(
		    $primary = 'id',  //这里告诉notorm 我们的主键都是id 这种英文单词
		    $foreign = '%sid',  //同理，外键都是 外表名+id    这个很重要，否则notorm拼接sql的时候会拼错。
		    $table = '%s',
		    $prefix =''
		);
		
		$pdo = new PDO($this->_dsn,DB_User,DB_UserPass);
	 	$pdo->query("set names utf8");
		$this->_db=new NotORM($pdo,$structure); //初始化
	} 
	function loadall($cols="",$where="",$order="",$limit="") //加载 。 
	{
		/**
		 * 取出一张表的全部信息
		 */

		$tbName=$this->_modelName;//表名
		if($cols=="")
		{
			$this->_result=$this->_db->$tbName();
		}
		else
		$this->_result=$this->_db->$tbName()->select($cols)->where($where);
		if($order!="") $this->_result=$this->result->order($order);
		if($limit!="") $this->_result=$this->result->limit($limit);
	}
	function loadAllWhere($where,$and) 
	{
		/**
		 * 取出对应条件的数据
		 */
		$tbName=$this->_modelName;
		$this->_result=$this->_db->$tbName()->select(" * ")->where('driver_name',$where)->and('driver_num',$and);
	}
	function insert($array)
	{
		/**
		 * 插表
		 */
		$tbName=$this->_modelName;
		$this->_result = $this->_db->$tbName()->insert($array);
		return $this->_result;
	}
	function sumAmount($get_driverName,$sumName)
	{	
		/**
		 * 合计金额
		 */
		$tbName=$this->_modelName;
		$this->_result = $this->_db->$tbName()->where('driver_name',$get_driverName)->sum($sumName);
		exit($this->_result);
		return $this->_result;
	}
	function delete($id)
	{	
		/**
		 * 删除一条信息
		 */
		$tbName=$this->_modelName;
		$this->_result = $this->_db->$tbName()->where('id',$id)->delete();
		return $this->_result;	
	}
	function update($id,$array)
	{
		/**
		 * 更瓣一条信息
		 */
		$tbName=$this->_modelName;
		$re = $this->_db->$tbName()->where('id',$id)->update($array);
		return $re;
	}
	function load($where)
	{
		/**
		 * 指定条件取一条数据
		 */
		$tbName=$this->_modelName;//表名
		if(trim($where)=="") return false;//禁止程序员 没有任何条件的 加载全表
		$this->_result=$this->_db->$tbName()->select(" * ")->where($where)->limit(1);
	}
	function loadAnd($where,$and)
	{
		/**
		 * 指定条件取一条数据
		 */
		$tbName=$this->_modelName;//表名
		if(trim($where)=="") return false;//禁止程序员 没有任何条件的 加载全表
		$this->_result=$this->_db->$tbName()->select(" * ")->where($where)->and($and);
	}
	function loadAndSingle($where,$and)
	{
		/**
		 * 指定条件取一条数据
		 */
		$tbName=$this->_modelName;//表名
		if(trim($where)=="") return false;//禁止程序员 没有任何条件的 加载全表
		$this->_result=$this->_db->$tbName()->select(" * ")->where($where)->and($and)->limit(1);
	}
	function loadAndCount($where)
	{
		/**
		 * 指定条件取一条数据
		 */
		$tbName=$this->_modelName;//表名
		if(trim($where)=="") return false;//禁止程序员 没有任何条件的 加载全表
		$this->_result=$this->_db->$tbName()->where('driver_name',$where)->count("*");
		return $this->_result;
	}
	function __get($pname)
	{
	  	if($this->_result && count($this->_result) == 1)
	  	{
	  		$ret=$this->_result->fetch();//取第一行   bug fetch()方法 是取下一行
		  	return $ret[$pname];
	  	}
	  	return false;
	}
	function all()
	{
		return 	$this->_result;
	}
 }

?>