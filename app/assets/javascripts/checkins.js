$(function() {
  
  var setLocation = function(id, name) {
    $("#checkin_location_name").val("")
    $("#checkin_location_name").parent().children("span.location_name").html(name);
    $("#checkin_location_id").val(id);
  }
  
  $("#checkinscontroller").ready(function() {
    $("#checkinscontroller #new_location input[type='submit']").hide();
    $("#checkinscontroller #new_location").dialog({
    			autoOpen: false,
    			height: 400,
    			width: 350,
    			modal: true,
    			buttons: {
    			  "Create Location": function() {
    			    $(this).submit();
    			  },
    			  Cancel: function() {
          		$( this ).dialog( "close" );
          	}
          },
    			close: function() {
    			  $.history.load("");
    			}});
    $("#checkinscontroller form#new_location").submit(function() {
      $.post("/locations.json", $(this).serialize(), function(data) {
        setLocation(data.id, data.name);
        $("#checkinscontroller #new_location").dialog("close");
        var notice = $("<p class=\"notice\">Location successfully created</p>");
        notice.insertAfter("header");
        notice.fadeOut(2000, function() { notice.remove(); });
      });
      return false;
    });
    $.history.init(function(hash) {
      if (hash == "new_location") {
        $("#checkinscontroller #new_location").dialog("open");
      } else {
        $("#checkinscontroller #new_location").dialog("close");
      }
    });
  });

  var callback = function(arg, callback) {
    $.getJSON("/locations", arg, function(result) {
      var locations = $.map(result, function(location) {
        return {
          id: location.id,
          label: location.name
        }
      });
      callback(locations);
    });
  };

  $("#checkin_location_name").autocomplete({
          source: callback,
          minLength: 3,
          select: function(event, ui) {
            setLocation(ui.item.id, ui.item.label);
          }
  });
});