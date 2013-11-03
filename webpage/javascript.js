$(".bar_wrapper").hover(function() {
  var name = $(this).attr("data-name");
  $('#category').text(name);
}),
function() {
  $('#category').text("");
}