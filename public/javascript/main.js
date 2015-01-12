(function() {
  $(document).ready(function() {
    var $headlines, $page_blocks;
    $page_blocks = false;
    $headlines = $('.page-text-container h2');
    $('.page-text-container h2').on('click', function() {
      if ($(this).hasClass('active')) {
        $(this).next().removeClass('active');
        return $(this).removeClass('active');
      } else {
        $page_blocks.removeClass('active');
        $(this).next().addClass('active');
        return $(this).addClass('active');
      }
    });
    return $('.page-text-container').each(function() {
      $headlines.each(function() {
        return $(this).nextUntil('h2').wrapAll('<div class="page-text-block" />');
      });
      $page_blocks = $('.page-text-block');
      return $headlines.eq(0).trigger('click');
    });
  });

}).call(this);
