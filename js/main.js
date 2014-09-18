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

function getCardImageById(card){
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

function getCardImage(){
       getCardImageById($("#card").val());
}

var nextId = 0;

function getCardElement(card, id){
  var cardElem = $( "#wallet-card-template" );
  cardElem = cardElem.children( ".wallet-card" ).clone();
  cardElem.data(card);
  cardElem.attr("id", "card" + id);
  cardElem.children(".wallet-card-image").attr("src",getCardImage(card.card));
  cardElem.children(".wallet-label").text(card.name);
  cardElem.children(".delete-card").click(deleteCard);
  cardElem.children(".edit-card").click(editCard);
  return cardElem;
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
    var l = $("#wallet").length;
    var elem = getCardElement(card, ++nextId);
    var e = elem.html();
    $("#wallet").append(elem);
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

    $( "#add-card" ).dialog( "option", "title", "Edit Card" );
    $( "#add-card" ).dialog( "option", "buttons", getButtons(dlgOK, dlgOK));
    $( "#add-card" ).dialog( "open" );
}

function dlgOK(){
	addNewCard();
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
        $("#bank").empty();
	$("#bank").append("<option selected=\"selected\">Please wait...</option>");
	getBank();
	event.preventDefault();
  });
  
  $(window).resize(function() {
    $("#add-card").dialog("option", "position", {my: "center", at: "center", of: window});
  });
});

