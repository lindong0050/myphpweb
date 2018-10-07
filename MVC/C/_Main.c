<?php
require("tplfunc.c");
$foreach_id=array();
function foreach_callback($match)
{
 	$id=md5(uniqid());
	global $foreach_id;
	$foreach_id[]=$id;
 	return "{".$match[1].":".$match[2].":".$id;
}
class  _Main
{
 	var $_viewName="index";
	var $_objectList=array();//变量数组
	var $isFileCache=false;//是否保存文件缓存
	/**
	 * 数据库查询完返给前台
	 */
 	function addObject($objName,$objValue)
 	{
		$this->_objectList[$objName]=$objValue;
 	}
 	/**
 	 * 取模块
 	 */
	function setViewName($vname)
	{
		$this->_viewName=$vname;
	}
	/**
	 * 默认运行模块
	 */
	function run()
	{
		extract($this->_objectList);//.解包变量
		$viewPath=Current_ViewPath;
		include("MVC/V/".$viewPath."/head.tpl");//加载头模板
		include("MVC/V/".$viewPath."/".$this->_viewName.".tpl"); //加载业务模板 		
		include("MVC/V/".$viewPath."/footer.tpl");//加载尾模板
	
	}
 }
?>