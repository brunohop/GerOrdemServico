 jQuery(document).ready(function($) {
   $("a.word-export").click(function(event) {
   $("#export-content").wordExport();
   });
 });
//imprime em pdf,xls,doc,png https://github.com/kayalshri/tableExport.jquery.plugin
 // jQuery(document).ready(function($) {
 //   $("a.word-export").click(function(event) {
 //   $("#export-content").tableExport({type:'excel',escape:'false',htmlContent:'false'});
 //   });
 // });
