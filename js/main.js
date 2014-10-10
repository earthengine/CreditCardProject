function getBank() {
       $.ajax({
               url:'get_bank.php',
               type:'get',
               dataType:'text',
               success:function(banks){
		       $("#bank").empty();
		       $("#bank").append("<option selected=\"selected\">- Please select a bank -</option>");
                       $("#bank").append(banks);
               }
       });
}

function getCard(){
       bank=$("#bank").val();
       $("#card").empty();
       $("#card").append("<option selected=\"selected\">- Please select a card -</option>");
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

function getRecommendedCards(){
       $.ajax({
               url:'card_recommendation.php',
               data:{},
               type:'post',
               dataType:'html',
               success:function(cards){
            $("#card-recommend-list").empty();
			$("#card-recommend-list").append(cards);
               }
       });
	$("card_recommendation")
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

var wallet = Wallet();

function getCardElement(card, cont){
    getCardImageById(card.id, function(cardimg){
		var cardElem = $( "#wallet-card-template" );
		cardElem = cardElem.children( ".wallet-card" ).clone();
		cardElem.data("card",card);
		cardElem.attr("id", "card_" + card.name+ "_" + card.ams);
		var wci = cardElem.children(".wallet-card-image");
		wci.attr("src","image/cards/" + cardimg);
		wci.attr("alt",card.name);
		cardElem.children(".wallet-label").text(card.name);
		cardElem.children(".delete-card").click(deleteCard);
		cardElem.children(".edit-card").click(editCard);
		cont(cardElem);
	});
}

function addNewCard(){
    var card = {
		bank:$( "#bank" ).val(),
		id:$( "#card" ).val(),
		name:$( "#card option:selected" ).text(),
		ams:$( "#ams" ).val(),
		bpem:$( "#bpem" ).val(),
		pir:$( "#pir" ).val(),
		psa:$( "#psa" ).val()
    }
	wallet.addCard(card);
    getCardElement(card, function(elem){
		$("#wallet").append(elem);
    });
}

function getButtons(onOK, onCancel){
	return [{text: "Ok", click: onOK},{text: "Cancel", click: onCancel}];
}

function deleteCard(event){
    var obj = $(event.target).parent();
    var ord = obj.index();
	wallet.deleteCard(obj.data("card"));
	obj.remove();
}

function editCard(event){
    var card = $(event.target).parent().data("card");

    $( "#bank" ).val(card.bank);
    $( "#card" ).val(card.id);
    $( "#ams" ).val(card.ams);
    $( "#bpem" ).val(card.bpem);
    $( "#pir" ).val(card.pir);
    $( "#psa" ).val(card.psa);

    $( "#add-card" ).dialog( "option", "title", "Edit Card" );
    $( "#add-card" ).dialog( "option", "buttons", getButtons(function(){ 
		dlgEditOK(card, $(event.target).parent()) 
	}, dlgClose));
    $( "#add-card" ).dialog( "open" );
}

function updateCardElement(cardElem, card){
    getCardImageById(card.id, function(cardimg){
		cardElem.data("card",card);
		cardElem.attr("id", "card_" + card.name+ "_" + card.ams);
		var wci = cardElem.children(".wallet-card-image");
		wci.attr("src","image/cards/" + cardimg);
		wci.attr("alt",card.name);
		cardElem.children(".wallet-label").text(card.name);
		cardElem.children(".delete-card").click(deleteCard);
		cardElem.children(".edit-card").click(editCard);
	});
}

function dlgEditOK(card, element){
	wallet.deleteCard(card);
	var editedCard = {
		bank:$( "#bank" ).val(),
		name:$( "#card option:selected" ).text(),
		ams:$( "#ams" ).val(),
		bpem:$( "#bpem" ).val(),
		pir:$( "#pir" ).val(),
		psa:$( "#psa" ).val()
    }
	wallet.addCard(editedCard);
    updateCardElement(element, editedCard);
	dlgClose();
}

function dlgAddOK(){
	addNewCard();
	dlgClose();
	$( "#add-card" ).dialog( "option", "title", "Add Card" );
	$( "#add-card" ).dialog( "option", "buttons", getButtons(dlgAddOK, dlgClose));
}

function dlgClose(){
	$( "#add-card" ).dialog( "close" );
}

$(document).ready(function(){
  $("#add-card").dialog({
	autoOpen: false,
	width: 500,
	modal: true,
	buttons: getButtons(dlgAddOK, dlgClose)
  });

  getRecommendedCards();
  
  $( "#add-card-link" ).click(function( event ) {
	$( "#add-card" ).dialog( "open", "Add Card" );
    $("#bank").empty();
	$("#bank").append("<option selected=\"selected\">Please wait...</option>");
	getBank();
	event.preventDefault();
  });
  
  $(window).resize(function() {
    $("#add-card").dialog("option", "position", {my: "center", at: "center", of: window});
  });
});

