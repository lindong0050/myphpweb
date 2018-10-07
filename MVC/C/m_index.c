<?php
 
 class m_index extends _Main
 {
 	 
     function m_index()
	 {
	 	$this->isAdmin=true;
	 }
	 
	 /**
	  * permission:{"role":"admin"} 
	  * 本方法只有admin角色才能调用
	  */
	 function index()//注释
	 {
	 	$this->setViewName("index");
	 }
	 function listprod()
	 {
	  
	 	 $this->setViewName("listProd");
	 }
	
	 function getprod()
	 {
	 	$page=1;
		if(isset($_GET["page"])) $page=intval($_GET["page"]);
		$pagesize=2;//每页显示多少条
			if(isset($_GET["rows"])) $pagesize=intval($_GET["rows"]);
		$prod=load_model("prod");
		$ret=$prod->_db->shop_prod()->select('*');//注意这一行 是写死的
		$ret=$ret->order("id desc")->limit($pagesize,($page-1)*$pagesize);
	   //把notor的值直接转化为array
		$array=array_map('iterator_to_array', iterator_to_array($ret));
		 $data=array();
		  foreach($array as $r)
		   $data[]=$r;
		 $result=array("rows"=>$data,"total"=>$prod->_db->shop_prod()->count("*")
		 ,"page"=>$page);
		 echo json_encode($result);
		exit();
	 }
	 function prod()
	 {
	 	if($_POST)
		{
			$prod=load_model("prod");
		 	
			$ispub=isset($_POST["prod_ispub"])?1:0;
			$addtime= date('Y-m-d h:i:s',strtotime($_POST["addtime"]));
			$ret=$prod->_db->shop_prod()->insert(array(
			 "prod_name"=>GET("prod_name","post"),
			 "prod_intr"=>GET("prod_intr","post"),
			 "prod_content"=>GET("prod_content","post"),
			 "prod_classid"=>GET("prod_classid","post"),
			 "prod_price1"=>GET("prod_price1","post"),
			 "prod_price2"=>GET("prod_price2","post"),
			 "prod_ispub"=>$ispub,
			 "addtime"=>$addtime
			));
			exit($ret);
		}
		 
		$cols=load_model("columns",DB_SysDSN);
		
		$cols->loadall(" * "," TABLE_NAME='shop_prod' and  EXTRA!='auto_increment'  ");
		
	 
		 $this->addObject("tbSet",$cols->all());
		 
		
	 	$this->setViewName("addProd");
	 }
	 function getTree_childs($pid,$tree,$parentNode)
	 {
	 	$children=array();
			foreach($tree as $r)
				{
					if($r["pid"]==$pid)
					{
						$child=array("id"=>$r["id"],"text"=>$r["tree_text"]
						,"state"=>$r["tree_state"],
						"attributes"=>array(url=>$r["tree_url"])); 
						$children[]=$child;
					}
				} 
				return $children;
	 }
	 function tree()
	 {
	 	$tree=load_model("m_tree");
		
		$tree->loadall();
		$ret=$tree->all();
		$ret2=clone($ret);
	   $treeList=array();//拼接成的树形菜单
		foreach($ret as $r)
		{
			 // echo $r["tree_text"]."<br/>";
			
			 if($r["pid"]==0) //代表是根节点
			{
				$parentNode=array("id"=>$r["id"],"text"=>$r["tree_text"]
						,"state"=>$r["tree_state"]);
				$get_children=$this->getTree_childs($r["id"],$ret2,$parentNode);
				if(count($get_children)>0)
				$parentNode["children"]=$get_children;
				$treeList[]=$parentNode;	
				 
			} 
		}
	 
		exit(json_encode($treeList));
	 }
 }

?>