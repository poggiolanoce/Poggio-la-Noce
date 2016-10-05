(function() {
  $(document).ready(function() {
    var $headlines, $page_blocks, clearErrors, populateErrors;
    $page_blocks = false;
    $headlines = $('.page-text-container h2, .shipping-group h3');
    $headlines.on('click', function() {
      var $parent_block, $sibling_headings, $sibling_text, $sibling_text_class;
      $parent_block = $(this).parent();
      $sibling_headings = $parent_block.find('h2,h3');
      $sibling_text_class = $sibling_headings.first().next().attr('class');
      $sibling_text = $parent_block.find('.' + $sibling_text_class.split(' ').pop());
      if ($(this).hasClass('active')) {
        $(this).next().removeClass('active');
        return $(this).removeClass('active');
      } else {
        $sibling_headings.removeClass('active');
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
    $.featherlight($('.shipping-confirmation'), {
      otherClose: '.close',
      closeIcon: ''
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
