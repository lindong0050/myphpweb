<script>
function driverkime(){
	$.post("/member/driverkimeAction/",
	{
		"inputKime":$("#inputKime").val()
	},function(result){
		 if(result=="1")
		 {
		 	alert("添加成功");
		 	self.location.reload();
		 }
		 else
		 {
		 	alert(result);
		 }
	});
}
</script>
<div class="container col-md-12">
	<div class="row">
		<div class="col-md-12 column">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					 <label for="inputKime" class="col-sm-3 control-label">请输入公里数：</label>
					<div class="col-sm-9">
						<input class="form-control" id="inputKime" type="text" placeholder="请输入公里数" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputPass" class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						 <button type="button" class="btn btn-info" onclick="driverkime()" >确定添加公里数</button>
						 <button type="button" onclick="self.parent.sd_remove();" class="btn btn-default">关闭</button>
					</div>
				</div>
				</br><!--[if IE]>
					
				<![endif]-->
				</br><!--[if IE]>
					
				<![endif]-->
				</br><!--[if IE]>
					
				<![endif]-->
			</form>
		</div>
	</div>
</div>