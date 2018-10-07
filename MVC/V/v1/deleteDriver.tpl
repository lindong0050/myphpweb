<script>
function deleteDriver()
{
	$.post("/member/deleteDriverAction/",
	{
		"driverName":$("#inputDriverName").val(),
		"driverNum":$("#inputDriverNum").val()
	},function(result){
		 if(result=="1")
		 {
		 	alert("删除成功");
		 	self.location.reload();
		 }
		 else
		 {
		 	alert(result);
		 }
	})
}
</script>
<div class="container col-md-12">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<form class="form-horizontal" role="form">
				<div class="form-group">
					 <label for="inputUserName" class="col-sm-3 control-label">司机名字：</label>
					<div class="col-sm-9">
						<input class="form-control" id="inputDriverName" type="text" value="<?php echo $driverNames?>" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPass" class="col-sm-3 control-label">司机车牌号：</label>
					<div class="col-sm-9">
						<input class="form-control" id="inputDriverNum" type="text" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-3 col-sm-10">
						 <button type="button" class="btn btn-info" onclick="deleteDriver()"  >删除司机</button>
						 <button type="button" onclick="self.parent.sd_remove();" class="btn btn-default">关闭</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>