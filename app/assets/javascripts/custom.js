$(function() {
  var list_table = $(".word-list table");
  list_table.hide();
  
  var current = list_table.first();
  current.show();
  
  $(".answer").click(function (e) {
    current.hide();
    current = current.next();
    current.show();
    e.preventDefault();
  });
});