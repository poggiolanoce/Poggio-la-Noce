(function() {
  $(document).ready(function() {
    var $banner_arrows, $banner_dots, $headlines, $page_blocks, $wine_content, $wine_selection, changeSlide, clearErrors, current_slide, finishChangeslide, is_transitioning, max_slide, populateErrors;
    $page_blocks = false;
    $headlines = $('.page-text-container h2');
    $wine_selection = $('.wine-browser li');
    $wine_content = $('.wine-page-content');
    is_transitioning = false;
    current_slide = 0;
    max_slide = $('.banners .banner').length - 1;
    $banner_dots = $('.banner-dots li');
    $banner_arrows = $('.banner-arrows li');
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
        return $(this).nextUntil('h2').wrapAll('<div class="page-text-block" />');
      });
      $page_blocks = $('.page-text-block');
      return $(this).find('h2').eq(0).trigger('click');
    });
    $wine_selection.on('click', function() {
      var $selection;
      $wine_selection.removeClass('active');
      $(this).addClass('active');
      $wine_content.removeClass('active');
      $selection = $("#wine-" + ($(this).data('wine')));
      return $selection.addClass('active');
    });
    if ($('.banners .banner').length > 1) {
      $('.banners').addClass('banner_slideshow');
    }
    $banner_dots.on('click', function() {
      var next_slide;
      next_slide = $(this).data('slide');
      return changeSlide(next_slide);
    });
    $banner_arrows.on('click', function() {
      var direction;
      direction = $(this).hasClass('previous') ? -1 : 1;
      if (current_slide === 0 && direction === -1) {
        return changeSlide(max_slide);
      } else if (current_slide === max_slide && direction === 1) {
        return changeSlide(0);
      } else {
        return changeSlide(current_slide + direction);
      }
    });
    changeSlide = function(slide) {
      var $active, $previously_active;
      $previously_active = $('.banners .banner.active');
      $active = $('.banners .banner').eq(slide);
      if ($previously_active === $active) {
        return false;
      }
      if (is_transitioning) {
        return false;
      }
      is_transitioning = true;
      current_slide = slide;
      $banner_dots.filter('.active').removeClass('active');
      $banner_dots.eq(slide).addClass('active');
      $previously_active.removeClass('active').addClass('previously_active');
      $active.addClass('active');
      return setTimeout(finishChangeslide, 1000);
    };
    finishChangeslide = function() {
      $('.previously_active').removeClass('previously_active');
      return is_transitioning = false;
    };
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
