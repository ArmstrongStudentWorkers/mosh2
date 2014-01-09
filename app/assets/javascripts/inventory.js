$(function () {
  $(".btn-group button").click(function () {
    var $select     = $('#select').empty();
    var button_text = $(this).text();
    var url         = '';

    $("#search_type").val(button_text);

    if (button_text === 'Location') {
      url = 'locations.json';
    }
    else if (button_text === 'Status') {
      url = 'hardware_statuses.json';
    }
    else if (button_text === 'Type') {
      url = 'hardware_types.json';
    }
    else {
      console.log('Unknown button pressed.');
      url = '';
    }
    $.ajax({type: 'GET',
      url: url,
      success: function(msg) {
        $.each(msg, function(index, value) {
          console.log(value.id + ',' + value.name);
          $select.append('<option value="' +
            value.id + '">' + value.name + '</option>');
        });
      }
    });
  });
});
