(function() {
  $(document).ready(function() {
    var $headlines, $page_blocks, clearErrors, populateErrors;
    $page_blocks = false;
    $headlines = $('.page-text-container h2');
    $('.page-text-container h2').on('click', function() {
      var $parent_block, $sibling_h2s, $sibling_text;
      $parent_block = $(this).parent();
      $sibling_h2s = $parent_block.find('h2');
      $sibling_text = $parent_block.find('.page-text-block');
      if ($(this).hasClass('active')) {
        $(this).next().removeClass('active');
        return $(this).removeClass('active');
      } else {
        $sibling_h2s.removeClass('active');
        $sibling_text.removeClass('active');
        $(this).next().addClass('active');
        return $(this).addClass('active');
      }
    });
    $('.page-text-container').each(function() {
      $(this).find('h2').each(function() {
        return $(this).nextUntil('h2, .add-to-cart').wrapAll('<div class="page-text-block" />');
      });
      $page_blocks = $('.page-text-block');
      return $(this).find('h2').eq(0).trigger('click');
    });
    $('.banners').slideshow({
      autoplay: true,
      dots: true,
      "class": 'banner_slideshow'
    });
    $('[data-gallery]').on('click', function() {
      return $.featherlight($(this).data('gallery'), {
        afterOpen: function() {
          return this.$content.find('.gallery').slideshow();
        }
      });
    });
    clearErrors = function() {
      $('.errors').hide();
      return $('.errors ul').html('');
    };
    populateErrors = function(response) {
      var errorList, key;
      errorList = [];
      for (key in response.error) {
        if (response.error.hasOwnProperty(key)) {
          errorList.push(response.error[key][0]);
        }
      }
      $.each(errorList, function(k, v) {
        return $('.errors ul').append("<li>" + v + "</li>");
      });
      return $('.errors').show();
    };
    return $("#contact form").submit(function(ev) {
      var data;
      ev.preventDefault();
      data = $(this).serialize();
      clearErrors();
      $.post("/", data, function(response) {
        if (response.success) {
          $('form').hide();
          $(".success").show();
        } else {
          populateErrors(response);
        }
      });
    });
  });

}).call(this);
