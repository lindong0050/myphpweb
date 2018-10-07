<script>
function driverDetailAdd(){
	$.post("/member/driverDAction/",
	{
		"starPlace":$("#starPlace").val(),
		"endPlace":$("#endPlace").val(),
		"carNum":$("#carNum").val(),
		"kiloMetreNumber":$("#kiloMetreNumber").val(),
		"unitPrice":$("#unitPrice").val(),
		"amount":amount,
		"duAmount":$("#duAmount").val(),
		"remark":$("#remark").val(),
		"driverName":$("#driverName").val(),
		"driverNum":$("#driverNum").val()
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
var amount;
function chengfa()
{
	var carNum = $("#carNum").val();
	var unitPrice = $("#unitPrice").val();
	amount = carNum * unitPrice;
	
	$("#amount").html(amount)
}
</script>
<div class="container col-md-12">
	<div class="row">
		<div class="col-md-12 column">
			<form class="form-horizontal" role="form">			
				<div class="form-group">
					 <label for="starPlace" class="col-sm-3 control-label">起点：</label>
					<div class="col-sm-9">  
			            <select class="form-control" id="starPlace">
			                <option>请选择起点</option>
			                <?php foreach ($places as $placesList): ?>	                 
			                <option><?php echo $placesList['place_name'];?></option>
			                <?php endforeach;?>
			            </select>            
					</div>
				</div>
				<div class="form-group">
					 <label for="endPlace" class="col-sm-3 control-label">卸点：</label>
					<div class="col-sm-9">	
						<select class="form-control" id="endPlace">
			                <option>请选择卸点</option>
			                <?php foreach ($places as $placesList): ?>	                 
			                <option><?php echo $placesList['place_name'];?></option>
			                <?php endforeach;?>
			           </select>
					</div>
				</div>
				<div class="form-group">
					<label for="endPlace" class="col-sm-3 control-label">车数：</label>
					<div class="col-sm-9">	
						<select class="form-control" id="carNum">
			                <option>请选择车数</option>
			                <?php foreach ($carnums as $carnumsList): ?>	                 
			                <option><?php echo $carnumsList['car_num'];?></option>
			                <?php endforeach;?>
			           </select>
					</div>
				</div>
				<div class="form-group">
					 <label for="kilometreNumber" class="col-sm-3 control-label">公里数：</label>
					<div class="col-sm-9">
						<select class="form-control" id="kiloMetreNumber">
			                <option>请选择公里数</option>
			                <?php foreach ($kinums as $kinumsList): ?>	                 
			                <option><?php echo $kinumsList['kilometre_number'];?></option>
			                <?php endforeach;?>
			           </select>
					</div>
				</div>
				<div class="form-group">
					 <label for="unitPrice" class="col-sm-3 control-label">单价：</label>
					<div class="col-sm-9">
						<select class="form-control" id="unitPrice">
			                <option>请选择单价</option>
			                <?php foreach ($unprs as $unprsList): ?>	                 
			                <option><?php echo $unprsList['unit_price'];?></option>
			                <?php endforeach;?>
				        </select>
					</div>
				</div>
				<div class="form-group">
					 <label for="amount" class="col-sm-3 control-label">金额：</label>
					<div class="col-sm-9">			
					<button id="amount" type="button" onclick="chengfa()" class="btn btn-primary">点击自动计算</button>
					</div>
				</div>
				<div class="form-group">
					<label for="duAmount" class="col-sm-3 control-label">应扣金额：</label>
					<div class="col-sm-9">
					<input class="form-control" id="duAmount" type="text" placeholder="请输入应扣金额" />
					</div>
				</div>
				<div class="form-group">
					 <label for="remark" class="col-sm-3 control-label">备注：</label>
					<div class="col-sm-9">
						<input class="form-control" id="remark" type="text" placeholder="请输入备注" />
					</div>
				</div>
    			<div class="form-group">
					 <label for="driverName" class="col-sm-3 control-label">司机名字：</label>
					<div class="col-sm-9">
						<input class="form-control" id="driverName" value="<?php echo $driverName?>" />					
					</div>
				</div>
				<div class="form-group">
					 <label for="driverNum" class="col-sm-3 control-label">车牌号：</label>
					<div class="col-sm-9">
						<input class="form-control" id="driverNum" value="<?php echo $driverNum?>" />					
					</div>
				</div>
				<div class="form-group">
					<label for="inputPass" class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						 <button type="button" class="btn btn-info" onclick="driverDetailAdd()" >确定添加明细</button>
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