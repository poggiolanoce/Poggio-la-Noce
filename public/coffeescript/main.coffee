$(document).ready ->
  $page_blocks = false
  $headlines = $('.page-text-container h2')
  
  $wine_selection = $('.wine-browser li')
  $wine_content =  $('.wine-page-content')

  is_transitioning = false
  current_slide = 0
  max_slide = $('.banners .banner').length - 1
  $banner_dots = $('.banner-dots li')
  $banner_arrows = $('.banner-arrows li')

  # Make each section active when clicked
  $('.page-text-container h2').on 'click', ()->
    $parent_block = $(this).parent()
    $sibling_h2s = $parent_block.find('h2')
    $sibling_text = $parent_block.find('.page-text-block')
    
    if $(this).hasClass('active')
      $(this).next().removeClass('active')
      $(this).removeClass('active')
    else
      $sibling_h2s.removeClass('active')
      $sibling_text.removeClass('active')
      $(this).next().addClass('active')
      $(this).addClass('active')

  # Wrap content for collapsing content areas
  $('.page-text-container').each ()->
    $(this).find('h2').each ()->
      $(this).nextUntil('h2').wrapAll('<div class="page-text-block" />')
    $page_blocks = $('.page-text-block')

    $(this).find('h2').eq(0).trigger('click')

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

  $banner_dots.on 'click', ()->
    next_slide = $(this).data('slide')
    changeSlide(next_slide)

  $banner_arrows.on 'click', ()->
    direction = if $(this).hasClass('previous') then -1 else 1
    if current_slide == 0 && direction == -1
      changeSlide(max_slide)
    else if current_slide == max_slide && direction == 1
      changeSlide(0)
    else
      changeSlide(current_slide + direction)
    


  changeSlide = (slide)->
    $previously_active = $('.banners .banner.active')
    $active = $('.banners .banner').eq(slide)

    if $previously_active == $active then return false
    if is_transitioning then return false

    is_transitioning = true
    current_slide = slide

    $banner_dots.filter('.active').removeClass('active')
    $banner_dots.eq(slide).addClass('active')

    $previously_active.removeClass('active').addClass('previously_active')
    $active.addClass('active')

    setTimeout finishChangeslide, 1000

  finishChangeslide = ()->
    $('.previously_active').removeClass('previously_active')
    is_transitioning = false