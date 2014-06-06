$(function( $ ) {
  var form = $("#new_daycare_pokemon");
  var showTrigger = $('#daycare_form_show');
  var hideTrigger = $('#daycare_form_hide');

  showTrigger.click(function(){
    $(this).toggle();
    hideTrigger.toggle();
    form.slideDown();
  });

  hideTrigger.click(function(){
    $(this).toggle();
    showTrigger.toggle();
    form.slideUp();
    form[0].reset();
  })

});
