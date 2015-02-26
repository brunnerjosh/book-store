var toggleLogIn = function(){
	$(".signin-dropdown").toggle();
	$("#signin").toggleClass("is-active");
};

var viewShoppingBag = function(){
	$(".bag-dropdown").toggle();
	$("#shopping-bag").toggleClass("is-active");
};

$(".book-categories").change(function () {
    $("#selectedCategory").val($('#categorySelect').val());
});

$(".rating-options").change(function () {
    $("#selectedRating").val($('#ratingSelect').val());
});

//var openAddBooks = function(){
//	$("#add-book-details").show();
//	$("#add-user-details").hide();
//	$(".table-list-group").hide();
//	$("#add-books").addClass("is-active");
//	$("#add-users").removeClass("is-active");
//}
//
//var openAddUsers = function(){
//	$("#add-user-details").show();
//	$(".table-list-group").show();
//	$("#add-book-details").hide();
//	$("#add-users").addClass("is-active");
//	$("#add-books").removeClass("is-active");
//}

//var toggleElement = function(toggleThis) {
//	console.log("To toggle: " + toggleThis);
//	alert("Foobar");
//
//}

$(document).ready(function(){
  console.log("App is loaded :) Enjoy!");



});
