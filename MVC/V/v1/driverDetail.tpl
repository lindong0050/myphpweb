<style>
.price{color:#e4393c}
.btn:hover{border-color:#e4393c;color:#e4393c;background:#ffffff;}
td.highlight {
    background-color: whitesmoke !important;
}
</style>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column"><!--司机明细-->
			<div class="row">
				<div class="table-responsive">
				<table class="table table-hover">
				  <tr>
				  	<td>车主姓名 :</td>	
				  	<td><input type="text" name="driverName" id="driverName" value="<?php echo $driverName ?>" /></td>
				  	<td>车牌号 ：</td>
					<td><?php echo $driverNum ?></td>
				  	<td>
				  		<?php $getUser=the_user();?>
			 			<?php if($getUser):?>
					</td>
					<td></td>
					<td>
						<a href='#' onclick='showWindow("添加明细","/member/driverDetailAdd/?driver_name=<?php echo $driverName ?>&driver_num=<?php echo $driverNum ?>",800)'>添加明细</a>
					</td>
					<td></td>
					<td></td>
					<?php else:?>
					<td></td>
					<?php endif;?>
				  	<td></td>
				  </tr>
				</table>
				<table id="myTable" class="table table-hover" cellspacing="0" width="100%">
					<thead>
					<tr>
						<th>id</th>
					  	<th>名字</th>
			            <th>开始地点</th>
			            <th>卸点</th>
			            <th>车数</th>
			            <th>公里数</th>
			            <th>单价</th>
			            <th>金额</th>
			            <th>应扣金额</th>
			            <th>备注</th>
			            <th>修改与删除</th>
					</tr>
					</thead>
					<tbody>
			            
	    			</tbody>
				</table>
				<table class="table table-hover">
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							合计金额：
						</td>
						<td>
							<button type="button" id="dAmount" onclick="amountSum()">点击计算总额</button>
						</td>
						<td>应扣金额合计：</td>
						<td>
							<button type="button" id="buckledAmount" onclick="buckleCountAmount()">点击计算应扣总额</button>	
						</td>
						<td>实扣金额：</td>
						<td><button type="button" id="buckleAmount" onclick="buckleAmount()">点击计算实发总额</button></td>
					</tr>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		var table = $('#myTable').DataTable({
    	"autoWidth": false,//自适应宽度
    	"serverSide": false,//服务器模式
    	"processing": true,
    	"paging": false,
    	"searching": true,
		"ordering": true,
        "info":true,
    	"language": {
    					"sProcessing": "处理中...",
				        "sLengthMenu": "显示 _MENU_ 项结果",
				        "sZeroRecords": "没有匹配结果",
				        "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				        "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
				        "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
				        "sInfoPostFix": "",
				        "sSearch": "搜索:",
				        "sUrl": "",
				        "sEmptyTable": "表中数据为空",
				        "sLoadingRecords": "载入中...",
				        "sInfoThousands": ",",
				        "oPaginate": {
				            "sFirst": "首页",
				            "sPrevious": "上页",
				            "sNext": "下页",
				            "sLast": "末页"
				        },
				        "oAria": {
				            "sSortAscending": ": 以升序排列此列",
				            "sSortDescending": ": 以降序排列此列"
				        }
                   },
    	"paging": true,
    	"scrollY": 400,
    	"aLengthMenu": [[10, 20, 30, -1], [10, 20, 30, "All"]],
        "ajax": "/index/getDriverDetail/", 
        "dataSrc": "data",
        "type": "POST",
       	"columns":[
	       		{ data: "id"},
	            { data: '名字' },
	            { data: '开始地点' },
	            { data: '卸点' },
	            { data: '车数' },
	            { data: '公里数' },
	            { data: '单价' },
	            { data: '金额' },
	            { data: '应扣金额' },
	            { data: '备注' },
	            { data: '修改与删除'}
	        ]
		});
		table.rows( {selected:true} ).data();
	})
	
	$.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var name = $('#driverName').val();
		var dirver_name = data[1];
        if (name == dirver_name)
        {
            return true;
        }
        	return false;
    	}
	);
    var amount;
	var bu_amount;	
	function amountSum()
	{
		var sumName='amount';
		$.post("/member/countAmountAction/",
		{
			"driverName":$("#driverName").val(),
			"driverNum":$("#driverNum").val(),
			"sumName":sumName
		},function(result){	
			 if(result!="")
			 {
			 	amount=result;
			 	$("#dAmount").html(result);
			 }
			 
		});
	}
	function buckleCountAmount()
	{
		var sumName='bu_amount';
		$.post("/member/countAmountAction/",
		{
			"driverName":$("#driverName").val(),
			"carNum":$("#carNum").val(),
			"sumName":sumName
		},function(result){			 
			 if(result!="")
			 {
			 	bu_amount=result;
			 	$("#buckledAmount").html(result);
			 }
		});
	}
	function buckleAmount()
	{
		var buckleAmount = amount - bu_amount;
		$("#buckleAmount").html(buckleAmount);
	}
</script>