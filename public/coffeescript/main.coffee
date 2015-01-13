$(document).ready ->
  $page_blocks = false
  $headlines = $('.page-text-container h2')
  
  $wine_selection = $('.wine-browser li')
  $wine_content =  $('.wine-page-content')

  # Make each section active when clicked
  $('.page-text-container h2').on 'click', ()->
    if $(this).hasClass('active')
      $(this).next().removeClass('active')
      $(this).removeClass('active')
    else
      $page_blocks.removeClass('active')
      $headlines.removeClass('active')
      $(this).next().addClass('active')
      $(this).addClass('active')

  # Wrap content for collapsing content areas
  $('.page-text-container').each ()->
    $headlines.each ()->
      $(this).nextUntil('h2').wrapAll('<div class="page-text-block" />')
    $page_blocks = $('.page-text-block')

    $headlines.eq(0).trigger('click')

  # Wine Browsing
  $wine_selection.on 'click', ()->
    $wine_selection.removeClass('active')
    $(this).addClass('active')

    $wine_content.removeClass('active')
    $selection = $("#wine-#{$(this).data('wine')}")
    $selection.addClass('active')
