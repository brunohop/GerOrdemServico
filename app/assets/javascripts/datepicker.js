$(document).ready(function() {
   $('.datepicker')
    .datepicker({
       format: 'dd/mm/yyyy',
       startDate: new Date(),
       todayBtn: true,
       language: "pt-BR",
       todayHighlight: true })
    .on('changeDate', function(ev) {
      $(this).datepicker('hide');
   });

 });
