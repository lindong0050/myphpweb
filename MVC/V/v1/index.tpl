<style>
.price{color:#e4393c}
 
.btn:hover{border-color:#e4393c;color:#e4393c;background:#ffffff;}
</style>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div class="row"> <!--司机列表-->
				<div class="table-responsive">
				<table id="tableMy" class="table table-hover">
				<thead>
				<tr>
					<th>id</th>
					<th>名字</th>
					<th>车牌号</th>
					<th>添加时间</th>
					<th>查看详细</th>
					<th>删除司机</th>
				</tr>
				</thead>
				<tbody>
			            
	    		</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	var table = $('#tableMy').DataTable({
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
    	autoWidth: false,//自适应宽度
    	serverSide: false,//服务器模式
    	paging: true,
    	scrollY: 400,
    	"searching": true,
    	"aLengthMenu": [[10, 20, 30, -1], [10, 20, 30, "All"]],
        "ajax": "/index/getIndexDetail/", 
        "type": "POST",
       	"columns": [
       		{ data: 'id',"class": "center"},
            { data: '名字',"class": "center"},
            { data: '车牌号' },
            { data: '添加时间' },
            { data: '查看详细' },
            { data: '删除司机' }
        ]
    });
    $('#searchName').on( 'keyup', function () {
    	table.search( this.value ).draw();
	});
});   
</script>