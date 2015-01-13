(function() {
  $(document).ready(function() {
    var $headlines, $page_blocks, $wine_content, $wine_selection;
    $page_blocks = false;
    $headlines = $('.page-text-container h2');
    $wine_selection = $('.wine-browser li');
    $wine_content = $('.wine-page-content');
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
      $headlines.each(function() {
        return $(this).nextUntil('h2').wrapAll('<div class="page-text-block" />');
      });
      $page_blocks = $('.page-text-block');
      return $headlines.eq(0).trigger('click');
    });
    return $wine_selection.on('click', function() {
      var $selection;
      $wine_selection.removeClass('active');
      $(this).addClass('active');
      $wine_content.removeClass('active');
      $selection = $("#wine-" + ($(this).data('wine')));
      return $selection.addClass('active');
    });
  });

}).call(this);
