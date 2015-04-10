$(function() {
  var list_table = $(".word-current");
  list_table.hide();
  
  var current = list_table.first();
  current.show();
  $(".submit").hide();
  $(".next").hide();
  $(".answer").on("change", function(){
    $(".next").show();
  });
  $(".next").click(function (e) {
    $(this).hide();
    var index = parseInt($(this).attr("index"));
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