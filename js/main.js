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

function getNewCard(cont){
    var req = $.ajax({
		url: "interface/get_card.php",
		type: "GET",
		dataType: "html"});
    req.done(cont);
}

function getButtons(onOK, onCancel){
	return [{text: "Ok", click: onOK},{text: "Cancel", click: onCancel}];
}

function deleteCard(event){
	$(event.target).parent().remove();
}

function editCard(event){
    deleteCard(event);
    $( "#add-card" ).dialog( "option", "title", "Edit Card" );
    $( "#add-card" ).dialog( "option", "buttons", getButtons(dlgOK, dlgOK));
    $( "#add-card" ).dialog( "open" );
}

function dlgOK(){
	getNewCard(function(msg){
		var v1=$(msg);
		v1.children(".delete-card").click(deleteCard);
		v1.children(".edit-card").click(editCard);
		$("#wallet").append(v1);					
	});
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

