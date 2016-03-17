// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$( document ).ready(function() {
	//var user = currentUserName();
	var nick="";
	$('#nickselect').on('change', function() {
  		//alert( this.value ); // or $(this).val()
  		var v = $(this).val();
  		if(v=="anonymous"){
  			$("#nickfield").css('color','green');
  			nick=$("#nickfield").val();
  			if(!nick){
  				nick="";
  			}
  			//alert(nick);
  			$("#nickfield").val("anonymous");
  			$("#nickfield").prop('disabled', true);
  		} else if (v=="nick"){
  			$("#nickfield").css('color','green');
  			$("#nickfield").prop('disabled', false);
  			$("#nickfield").val(nick);
  		} else if (v=="registered"){
  			$("#nickfield").css('color','blue');
  			$("#nickfield").val(nick);
  			$("#nickfield").prop('disabled', false);
  		} else { //real name
  			$("#nickfield").css('color','red');
  			if($("#nickfield").val()=="anonymous" || !$("#nickfield").val()){
  				//do nothing?
  			} else {
  				nick=$("#nickfield").val();
  			}
  			$("#nickfield").val(currentUserName());
  			$("#nickfield").prop('disabled', true);
  			//alert(user.name);
  		}
  	});
	$('#nickselect').trigger("change"); //set values
	//var user=CurrentUser();
	//alert(user.name);
});