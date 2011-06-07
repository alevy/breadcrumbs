$(function() {
  $("#checkinscontroller").ready(function() {
    $.history.init(function(hash) {
      if (hash == "new_location") {
        $("#checkinscontroller #new_location").show();
      } else {
        $("#checkinscontroller #new_location").hide();
      }
    });
  });
});