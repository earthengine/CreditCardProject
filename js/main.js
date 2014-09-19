function editCard(i, cont){
    var req = $.ajax({
		url: "interface/get_card.php",
		type: "GET",
		data: { id : i },
		dataType: "html",
                success: cont});
}

function getBank() {
    $.ajax({
        url:'get_bank.php',
        type:'get',
        dataType:'text',
        success:function(banks){
	        $("#bank").empty();
		    $("#bank").append("<option selected=\"selected\">- Please select a bank -</option>");
			$("#bank option:selected").data("");
            $("#bank").append(banks);
			$("#bank option").each(getCard);
			$("#bank").change(function(ev){
				$("#card").empty();
				$("#card").append("<option selected=\"selected\">- Please select a card -</option>");
				var b = $("#bank option:selected").data();
				$("#card").append($("#bank option:selected").data());
			});
        }
    });
}

function getCard(bankOpt){
       $.ajax({
               url:'get_card.php',
               data:"bank="+bankOpt,
               type:'get',
               dataType:'text',
               success:function(cards){
					var b = $("#bank option:eq(" + bankOpt + ")");
					b.data(cards);
               }
       });
}

function getCardImageById(card, cont){
       $("#cardimage").empty();
       $.ajax({
               url:'get_card_image.php',
               data:"card="+card,
               type:'get',
               dataType:'text',
               success:cont
       });
}

function getCardImage(){
    getCardImageById($("#card").val(), function(cardimg){
        $("#cardimage").empty();
        $("#cardimage").append(cardimg);
    });
}

var nextId = 0;

function getCardElement(card, id, cont){
    getCardImageById(card.id, function(cardimg){
		var cardElem = $( "#wallet-card-template" );
		cardElem = cardElem.children( ".wallet-card" ).clone();
		cardElem.data(card);
		cardElem.attr("id", "card" + id);
		var wci = cardElem.children(".wallet-card-image");
		wci.attr("src","image/cards/" + cardimg);
		wci.attr("alt",card.name);
		cardElem.children(".wallet-label").text(card.name);
		cardElem.children(".delete-card").click(deleteCard);
		cardElem.children(".edit-card").click(editCard);
		cont(cardElem);
	});
}

function addCard(){
	var card = {
	bank:$( "#bank" ).val(),
	id:$( "#card" ).val(),
	name:$( "#card option:selected" ).text(),
	ams:$( "#ams" ).val(),
	bpem:$( "#bpem" ).val(),
	pir:$( "#pir" ).val(),
	psa:$( "#psa" ).val()
	}
	getCardElement(card, ++nextId, function(elem){
        $("#wallet").append(elem);
	});
}

function getButtons(onOK, onCancel){
	return [{text: "Ok", click: onOK},{text: "Cancel", click: onCancel}];
}

function deleteCard(event){
	$(event.target).parent().remove();
}

function editCard(event){
    var card = $(event.target).parent().data();
    deleteCard(event);

    $( "#bank" ).val(card.bank);
    $( "#card" ).val(card.id);
    $( "#ams" ).val(card.ams);
    $( "#bpem" ).val(card.bpem);
    $( "#pir" ).val(card.pir);
    $( "#psa" ).val(card.psa);

	$( "#add-card" ).data(card);
    $( "#add-card" ).dialog( "option", "title", "Edit Card" );
    $( "#add-card" ).dialog( "option", "buttons", getButtons(dlgOK, dlgCancel));
    $( "#add-card" ).dialog( "open" );
}

function dlgCancel(){
	var card=$( "#add-card" ).data();
	getCardElement(card, card.id, function(elem){
        $("#wallet").append(elem);
	});
	dlgClose();
	$( "#add-card" ).dialog( "option", "title", "Add Card" );
	$( "#add-card" ).dialog( "option", "buttons", getButtons(dlgOK, dlgClose));
}

function dlgOK(){
	addCard();
	dlgClose();
	$( "#add-card" ).dialog( "option", "title", "Add Card" );
	$( "#add-card" ).dialog( "option", "buttons", getButtons(dlgOK, dlgClose));
}

function dlgClose(){
	$( "#add-card" ).dialog( "close" );
}

$(document).ready(function(){
  $("#add-card").dialog({
	autoOpen: false,
	width: 500,
	modal: true,
	buttons: getButtons(dlgOK, dlgClose)
  });
  
  $( "#add-card-link" ).click(function( event ) {
	$( "#add-card" ).dialog( "open", "Add Card" );
	getBank();
	$("#bank").val(0);
	$("#card").val(0);
	$("#ams").val(4000);
	$("#bpem").val(0);
	$("#pir").val(19);
	$("#psa").val(25);
	$("#af").val("");
	event.preventDefault();
  });
  
  $(window).resize(function() {
    $("#add-card").dialog("option", "position", {my: "center", at: "center", of: window});
  });
});

