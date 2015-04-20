$(function() {
  var list_table = $(".word-current");
  list_table.hide();
  
  var current = list_table.first();
  current.show();
  $(".submit").hide();
  $(".answer").on("change", function(){
    var index = parseInt($(this).parent().attr("index"));
    var count = parseInt($(".word-content").data("count"));
    if (index + 1 < count) {
      current.hide();
      current = current.next();
      current.show();
    } else {
      $(".submit").show();
    }
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