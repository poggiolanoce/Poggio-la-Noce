$(document).ready ->
  $page_blocks = false
  $headlines = $('.page-text-container h2')
  
  $wine_selection = $('.wine-browser li')
  $wine_content =  $('.wine-page-content')

  is_transitioning = false

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
    $(this).find('h2').each ()->
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


  # Slider
  if $('.banners .banner').length > 1
    $('.banners').addClass('banner_slideshow')

  $('.banner_slideshow .banner-dots li').on 'click', ()->
    next_slide = $(this).data('slide')
    changeSlide(next_slide)

  changeSlide = (slide)->
    $previously_active = $('.banners .banner.active')
    $active = $('.banners .banner').eq(slide)

    if $previously_active == $active then return false
    if is_transitioning then return false

    is_transitioning = true

    $previously_active.removeClass('active').addClass('previously_active')
    $active.addClass('active')

    setTimeout finishChangeslide, 2000

  finishChangeslide = ()->
    $('.previously_active').removeClass('previously_active')
    is_transitioning = false