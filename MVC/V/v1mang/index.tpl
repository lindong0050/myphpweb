 <script>
  $(document).ready(function(){
  	
  	function addTab(title,url)
  	{
  		 if ($('#mytab').tabs('exists', title))
  		 {
			$('#mytab').tabs('select', title);
		 }
  		 else {
		var content = '<iframe scrolling="yes" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
		$('#mytab').tabs('add',{
			title:title,
			content:content,
			closable:true
		});
		}
  	}
  	//加载树形菜单
  	$("#mytree").tree({
  		url:"/m_index/tree/",
  		onClick:function(node)
  		{
  			if(node.attributes && node.attributes.url)
  			{
  				addTab(node.text,node.attributes.url);
  			}
  			 
  		}
  	})
  	
  })
 </script>
	  <style>
	   .tabs-panels{height:100%;}
	  </style>
		<div data-options="region:'north'" style="height:50px;line-height:21pt;height:41pt;text-indent:2em;font-size:28px">微电商后台管理</div>
	 
		 
		<div data-options="region:'west',split:true" title="我的工作平台" style="width:220px;">
			
						<div class="easyui-accordion" data-options="fit:true,border:false">
				<div title="基础信息管理" style="padding:10px;" data-options="selected:true">
					<ul class="easyui-tree" id="mytree">
			 			
					</ul>
				</div>
				<div title="权限管理"  style="padding:10px;">
					content2
				</div>
				<div title="系统管理" style="padding:10px">
					content3
				</div>
			</div>
		
		</div>
		<div data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
			 	<div class="easyui-tabs" style="width:100%;height:100%" id="mytab">
		<div title="测试加载页" style="padding:10px" closable="true">
			<iframe src="/index/getindex/" style="width: 100%;height: 100%;" scrolling="yes" frameborder="0"></iframe>
		</div>
		 
	</div>
		</div>
	 