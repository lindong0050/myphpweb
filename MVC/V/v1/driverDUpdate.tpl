<script>
function driverDUpdate(){
	$.post("/member/driverUDAction/",
	{
		"starPlace":$("#starPlace").val(),
		"endPlace":$("#endPlace").val(),
		"carNum":$("#carNum").val(),
		"kiloMetreNumber":$("#kiloMetreNumber").val(),
		"unitPrice":$("#unitPrice").val(),
		"amount":amount,
		"remark":$("#remark").val(),
		"driverName":$("#driverName").val(),
		"bu_amount":$("#bu_amount").val(),
		"updateDelete":$("#updateDelete").val()
	},function(result){
		 if(result=="1")
		 {
		 	alert("成功");
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
	
	$("#amount").html(amount);
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
			                <option><?php echo $startPlace; ?></option>
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
			                <option><?php echo $endPlace; ?></option>
			                 <?php foreach ($places as $placesList): ?>	                 
			                <option><?php echo $placesList['place_name'];?></option>
			                <?php endforeach;?>
			           </select>
					</div>
				</div>
				<div class="form-group">
					<label for="endPlace" class="col-sm-3 control-label">车数：</label>
					<div class="col-sm-9">
			           	<select class="form-control" id="carNum" readonly="false">
			               	<option><?php echo $carNum; ?></option>
			               	<?php foreach ($carnums as $carnumsList): ?>	                 
			                <option><?php echo $carnumsList['car_num'];?></option>
			                <?php endforeach;?>
				       	</select>
					</div>
				</div>
				<div class="form-group">
					 <label for="kilometreNumber" class="col-sm-3 control-label">公里数：</label>
					<div class="col-sm-9">
						<select class="form-control" id="kiloMetreNumber" readonly="true">
			               <option><?php echo $kilometres; ?></option>
			               	<?php foreach ($kinums as $kinumsList): ?>	                 
			                <option><?php echo $kinumsList['kilometre_number'];?></option>
			                <?php endforeach;?>
			           </select>
					</div>
				</div>
				<div class="form-group">
					 <label for="unitPrice" class="col-sm-3 control-label">单价：</label>
					<div class="col-sm-9">
						<select class="form-control" id="unitPrice" readonly="false">
			               	<option><?php echo $unitPrice; ?></option>
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
					 <label for="bu_amount" class="col-sm-3 control-label">应扣金额：</label>
					<div class="col-sm-9">
				       <input class="form-control" type="text" id="bu_amount" value="<?php echo $bu_amount; ?>" />
					</div>
				</div>
				<div class="form-group">
					 <label for="remark" class="col-sm-3 control-label">备注：</label>
					<div class="col-sm-9">
				       <input class="form-control" type="text" id="remark" value="<?php echo $remark; ?>" />
					</div>
				</div>
    			<div class="form-group">
					 <label for="driverName" class="col-sm-3 control-label">司机名字：</label>
					<div class="col-sm-9">
						<input class="form-control" id="driverName" value="<?php echo $driverName;?>" />
					</div>
				</div>
				<div class="form-group">
					 <label for="remark" class="col-sm-3 control-label">修改或删除：</label>
					<div class="col-sm-9">
						<select class="form-control" id="updateDelete">
			                <option>请选择</option>		                              
			                <option>修改</option>
			                <option>删除</option>
				        </select>
					</div>
				</div>
				<div class="form-group">
					<label for="inputPass" class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						<button type="button" class="btn btn-info" onclick="driverDUpdate()" >确定修改明细</button>
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
