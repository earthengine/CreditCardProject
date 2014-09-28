function getBank() {
	$.ajax({
		url:'interface/get_bank.php',
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
		url:'interface/get_card.php',
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