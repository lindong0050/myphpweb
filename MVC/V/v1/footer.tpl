

<style>
#footer {
    background: #fff none repeat scroll 0 0;
    border-top: 1px solid #ddd;
    padding: 15px 0;
    text-align: center;
}
.mycart{position: fixed;right:0;bottom:10px;width:160px}
 
</style>
  <?php if(!$hideFooter):?>
  	
 	
<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<div id="footer">
				<div class="footerNav">
					 <a href="#">关于我们</a> | <a href="#">服务条款</a> | <a href="#">免责声明</a> | <a href="#">网站地图</a> | <a href="#">联系我们</a>
				</div>
				<div class="copyRight">
					Copyright ©2010-2018 顺辉公司代运费结算
				</div>
			</div>
			
		</div>
	</div>
</div>
 
 <script>
 	$(document).ready(function(){
 		function addCartNum(pid) //加入购物车
 		{
 			 
 			 $.post("/prod/addtocart/",{"pid":pid},function(result){
 			 	//alert(result);
 			 	$("#cartNum").html(result);
 			 })
 		}
 		$(".addToCart").click(function(){
 			var getPid=$(this).attr("pid");
 			var oldProd=$(this).parents(".prod");
 			var newProd=$(this).parents(".prod").clone();//复制品
 		 //alert($(oldProd).offset().left+":"+$(oldProd).offset().top)
 			newProd.css({
 				position:"fixed",left:$(oldProd).offset().left,top:$(oldProd).offset().top
 			})
 			$(oldProd).parent().append(newProd);
 			 
 			 newProd.animate({
 			 	left:$(".mycart").offset().left,
 			 	top:$(".mycart").offset().top,
 			 	width:0,
 			 	height:0
 			 },"slow","",function(){
 			 	$(newProd).remove();
 			 	addCartNum(getPid);
 			 });
 		 	return false;
 		})
 	})
 	
 </script>
 <?php endif;?>
	</body>
</html>