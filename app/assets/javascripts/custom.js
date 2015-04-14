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

  $('.remove-answer').click(function () {
    remove_fields(this);
  });

  $(".answers").each(function(){
    var boxes = $(this).find("input[type='checkbox']:checked");
    if(boxes.length == 0){
      $(this).find("input[type='checkbox']:first").prop("checked", true)
    }
  });
});