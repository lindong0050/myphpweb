<script>
var imgName = null;
// 初始化filleinput控件 第一次初始化
 function initFileInput(ctrlName, uploadUrl){
  var control = $('#'+ctrlName);
  control.fileinput({
	   language: 'zh', //设置语言
	   uploadUrl:uploadUrl, //上传的地址
	   allowedFileExtensions:['jpg','png','gif', 'png', 'bmp'], //接收的文件后缀
	   uploadAsync: false,
	   initialPreviewAsData : true,
	   enctype: 'multipart/form-data',
	   showUpload:false, //是否显示上传按钮
	   showCaption:true, //是否显示标题
	   maxFileSize: 1000, //图片最大尺寸kb 为0不限制
	   maxFilesNum: 3,  //最多上传图片
	   overwriteInitial: false,//不覆盖已上传的图片
	   browseClass: "btn btn-info", //按钮样式 
	   previewFileIcon: "<i class='glyphicon glyphicon-ban-circle'></i>",
	   msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！"
	})
}

//初始化fileinput控件,第一次初始化 (控件id，上传地址)
initFileInput("file-1", "/member/addImgAction/");
// 监听事件
$("#file-1").on("fileuploaded", function (event, data, previewId, index) {
//上传地址
imgName = data.response.imgName;
});
function addDriver(){
	var driverNum = $("#inputDrNu").val();
	var inputNumber = $("#inputNumber").val();
	var driverNumber = driverNum+inputNumber;
	$.post("/member/addDriverAction/",
	{
		"driverName":$("#inputDriverName").val(),
		"driverNumber":driverNumber,
		"driverImg":imgName
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
					 <label for="inputUserName" class="col-sm-3 control-label">司机名字：</label>
					<div class="col-sm-9">
						<input class="form-control" id="inputDriverName" type="text" placeholder="请输入司机名字" />
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPass" class="col-sm-3 control-label">司机车牌号：</label>
					<div class="col-sm-9">
						<select class="form-control" id="inputDrNu">
		                <option>请选择车牌号开头</option>
		                <?php foreach ($numbers as $num): ?>
		                <option><?php echo $num['driver_number']?></option>
		                <?php endforeach;?>
			           </select>
			           <input class="form-control" id="inputNumber" type="text" placeholder="请输入车牌数字" />
					</div>
				</div>
				<div class="form-group">
					<label for="inputPass" class="col-sm-3 control-label">添加卡车图片：</label>
        			<div class="col-md-9">
            			<form enctype="multipart/form-data">    
			     			<!-- 初始化插件 -->
			     			<input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1" name="images">
   						</form>
        			</div>
        			
    			</div>
    			
				<div class="form-group">
					<label for="inputPass" class="col-sm-3 control-label"></label>
					<div class="col-sm-9">
						 <button type="button" class="btn btn-info" onclick="addDriver()" >确定添加司机</button>
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