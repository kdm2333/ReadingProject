$(function() {
	//点击未出行订单
	$('#query_G').click( function() {
		$("#orderFlag").val(1);
		if($("#query_G").attr("class")=="active"){
			
		}else{
			$(this).addClass("active");
			$('#query_H').removeClass("active");
			$('#use_G').css('display', 'inline');
			$(".order-tab-bd label[for='orderdate']").html("查询日期");
			$('#orderinfobodyTable').empty();
			$('#noticketlist').css('display', 'none');
			$('#pagination').css('display', 'none');
		}	
	});
	
	//点击历史订单
	$('#query_H').click( function(e) {
		$("#orderFlag").val(2);
		if($("#query_H").attr("class")=="active"){		
		}else{
			$(this).addClass("active");
			$('#query_G').removeClass("active");
			$('#use_G').css('display', 'none');
			$(".order-tab-bd label[for='orderdate']").html("乘车日期");
			$('#orderinfobodyTable').empty();
			$('#noticketlist').css('display', 'none');
			$('#pagination').css('display', 'none');
		}	
	});
	$("#typeChange").change(function() {
		if($("#typeChange option:selected").val()==1) {
			$(".order-tab-bd label[for='orderdate']").html("查询日期");
		} else {
			$(".order-tab-bd label[for='orderdate']").html("乘车日期");
		}
	});
});
//显示与隐藏订单内容
function showOrderInfoList(sequenceNo){
	var className=$('#order_item_'+sequenceNo).attr("class");
    if("order-item"==className){
    	$('#order_item_'+sequenceNo).attr("class","order-item close");
    	$('#order-item-hd_'+sequenceNo).attr("class","order-item-hd hover");
    }else{
    	$('#order_item_'+sequenceNo).attr("class","order-item");
    }
}

//当鼠标移动到订单时改变背景色
function changeBackboundColor(sequenceNo, opera) {
	var className = $('#order_item_' + sequenceNo).attr("class");
	var status = $('#order_item_bd_' + sequenceNo).css("display");
	if ("order-item close" == className) {
		if (opera == "onmouseover") {
			 $('#order-item-hd_'+sequenceNo).attr("class","order-item-hd hover");
		}
		if (opera == "onmouseout") {
			 $('#order_item_' + sequenceNo).attr("class", "order-item close");
			 $('#order-item-hd_'+sequenceNo).attr("class","order-item-hd");
		}
	}
}
