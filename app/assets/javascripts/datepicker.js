$(document).ready(function() {
   $('.datepicker')
    .datepicker({
       format: 'dd/mm/yyyy',
       startDate: new Date("July 30, 2016 01:15:00"),
       todayBtn: true,
       language: "pt-BR",
       todayHighlight: true })
    .on('changeDate', function(ev) {
      $(this).datepicker('hide');
   });

 });
