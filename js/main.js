function getBank() {
	$.ajax({
		url:'get_bank.php',
		type:'get',
		dataType:'text',
		success:function(banks){
			$("#bank").append(banks);
		}
	});
}

function getCard(){
	bank=$("#bank").val();
	$("#card").empty();
	/*$("#card").append("<option selected=\"selected\">Loading cards info...</option>");*/
	$.ajax({
		url:'get_card.php',
		data:"bank="+bank,
		type:'get',
		dataType:'text',
		success:function(cards){
			$("#card").empty();
			$("#card").append("<option selected=\"selected\">- Please select a card -</option>");
			$("#card").append(cards);
		}
	});
}

function getCardImage(){
	card=$("#card").val();
	$("#cardimage").empty();
	$.ajax({
		url:'get_card_image.php',
		data:"card="+card,
		type:'get',
		dataType:'text',
		success:function(cardimg){
			$("#cardimage").empty();
			$("#cardimage").append(cardimg);
		}
	});
}

function app1(){
	return "<div class=\"box-row-card\"><img src=\"image/cards/ANZ_Rewards_Black.jpg\" alt=\"ANZ Rewards Black\"><div class=\"div-text\">ANZ Rewards Black With AMEX ($4000)</div><input type=\"button\" value=\"delete\"/></div>";
}

function deleteCard(event){
	$(event.target).parent().remove();
}

$(document).ready(function(){
	$("#addCard").click(function(){
		var v1=$(app1());
		v1.children("input").click(deleteCard);
		$("#wallet").append(v1);
	});
	$("input[value=\"delete\"]").click(deleteCard);
});
