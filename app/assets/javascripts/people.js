
$(document).ready(function() {
  var $form = $('form');

  $("button#submit-height-weight").on("click", function(event) {
    event.preventDefault();

    $('form').hide();

    $.ajax({
      type: 'GET',
      url: '/people',
      data: $form.serialize(),
      dataType: 'json',
      success: function(resp) {
        $('div.check-guess').show();
  
        var percentChanceMale = resp.percentMaleAtHeight * 0.5 + resp.percentMaleAtWeight * 0.5;
  
        if (percentChanceMale > 0.5) {
          $('.guess').html('My guess is: Male');
          $('button.correct').addClass('male');
        } else {
          $('.guess').html('My guess is: Female');
          $('button.incorrect').addClass('male');
        }
      }
    });
  });
  
  $('.check-guess button').on("click", function(event) {
    event.preventDefault();
    
    var $button = $(event.currentTarget);
    
    if ($button.hasClass('male')) {
      $('input#person_gender').prop('value', 'M');
    } else {
      $('input#person_gender').prop('value', 'F');
    }
    
    if ($button.hasClass('correct')) {
      $('div.response p').html("Yay I got it right");
    } else {
      $('div.response p').html("Aww Crap");
    }
    
    $('div.check-guess').hide();
    $('div.response').show();

    $.ajax({
      type: 'POST',
      url: '/people',
      data: $form.serialize(),
      dataType: 'json'
    });
  });
});