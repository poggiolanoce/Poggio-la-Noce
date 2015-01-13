(function() {
  $(document).ready(function() {
    var $banner_arrows, $banner_dots, $headlines, $page_blocks, $wine_content, $wine_selection, changeSlide, current_slide, finishChangeslide, is_transitioning, max_slide;
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
      if ($(this).hasClass('active')) {
        $(this).next().removeClass('active');
        return $(this).removeClass('active');
      } else {
        $page_blocks.removeClass('active');
        $headlines.removeClass('active');
        $(this).next().addClass('active');
        return $(this).addClass('active');
      }
    });
    $('.page-text-container').each(function() {
      $(this).find('h2').each(function() {
        return $(this).nextUntil('h2').wrapAll('<div class="page-text-block" />');
      });
      $page_blocks = $('.page-text-block');
      return $headlines.eq(0).trigger('click');
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
    return finishChangeslide = function() {
      $('.previously_active').removeClass('previously_active');
      return is_transitioning = false;
    };
  });

}).call(this);
