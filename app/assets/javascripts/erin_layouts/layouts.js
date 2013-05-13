$(document).ready(function() {
  $( "input[name=start_date]" ).datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 3,
    onClose: function( selectedDate ) {
      $( "input[name=end_date]" ).datepicker( "option", "minDate", selectedDate );
    }
  });
  $( "input[name=end_date]" ).datepicker({
    defaultDate: "+1w",
    changeMonth: true,
    numberOfMonths: 3,
    onClose: function( selectedDate ) {
      $( "input[name=start_date]" ).datepicker( "option", "maxDate", selectedDate );
    }
  });
});