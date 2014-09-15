function getNewCard(cont){
    var req = $.ajax({
		url: "interface/new_card.php",
		type: "GET",
		data: { id: 1 },
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
	width: 400,
	modal: true,
	buttons: getButtons(dlgOK, dlgClose)
  });
  
  $( "#dialog-link" ).click(function( event ) {
	$( "#add-card" ).dialog( "open", "Add Card" );
	event.preventDefault();
  });
  
  $(window).resize(function() {
    $("#add-card").dialog("option", "position", {my: "center", at: "center", of: window});
  });
});
