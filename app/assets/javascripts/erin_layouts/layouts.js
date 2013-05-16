$(document).ready(function() {
  $( "input[id=trip_start]" ).datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 1,
    onClose: function( selectedDate ) {
      $( "input[id=trip_end]" ).datepicker( "option", "minDate", selectedDate );
    }
  });

  $( "input[id=trip_end]" ).datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 1,
    onClose: function( selectedDate ) {
      $( "input[id=trip_start]" ).datepicker( "option", "maxDate", selectedDate );
    }
  });
});
