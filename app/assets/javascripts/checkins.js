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
  
  var makePlace = function(place) {
    var result = {
      woeid: place.woeid,
      lat: place.centroid.latitude,
      lng: place.centroid.longitude
    };
    result.label = place.name
    if (place.admin1) {
      result.label = result.label + ", " + place.admin1.content
    }
    if (place.country) {
      result.label = result.label + ", " + place.country.content;
    }
    return result;
  };

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
            $("#checkin_location_name").parent().children("span.location_name").html(ui.item.label);
            $("#checkin_location_id").val(ui.item.id);
          }
  });
});