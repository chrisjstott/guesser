$(document).ready(function() {
  var $form = $('form');

  $("button#submit-height-weight").on("click", function(event) {
    event.preventDefault();
    
    var validateForm = function () {
      $height = $('#person_height');
      $weight = $('#person_weight');
      
      var complete = true;
      
      if ($height.val() === "" || isNaN($height.val())) {
        complete = false;
        $height.parent().addClass('has-error');
      } else {
        $height.parent().removeClass('has-error');
      }
      if ($weight.val() === "" || isNaN($weight.val())) {
        complete = false;
        $weight.parent().addClass('has-error');
      } else {
        $weight.parent().removeClass('has-error');
      }
      
      return complete;
    };
    
    if (validateForm()) {
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
    }
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
      $('div.response p').html("Awesome!");
    } else {
      $('div.response p').html("Bummer!");
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
