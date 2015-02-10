var toggleLogIn = function(){
	$(".signin-dropdown").toggle();
	$("#signin").toggleClass("is-active");
} 

var openAddBooks = function(){
	$("#add-book-details").show();
	$("#add-user-details").hide();
	$("#add-books").addClass("is-active");
	$("#add-users").removeClass("is-active");
} 

var openAddUsers = function(){
	$("#add-user-details").show();
	$("#add-book-details").hide();
	$("#add-users").addClass("is-active");
	$("#add-books").removeClass("is-active");
} 

$(document).ready(function(){
  console.log("App is loaded :)");
  


});