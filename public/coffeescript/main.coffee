$(document).ready ->
  $page_blocks = false
  $headlines = $('.page-text-container h2')

  is_transitioning = false
  current_slide = 0
  max_slide = $('.banners .banner').length - 1
  $banner_dots = $('.banner-dots li')
  $banner_arrows = $('.banner-arrows li')

  $slideshow_speed = 4000

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
      $(this).nextUntil('h2, .add-to-cart').wrapAll('<div class="page-text-block" />')
    $page_blocks = $('.page-text-block')

    $(this).find('h2').eq(0).trigger('click')

  # Slider
  start_autoplay = ()->
    $.doTimeout 'autoplay', $slideshow_speed, ()->
      console.log 'hi'
      changeSlide(bannerIncrement(1), true)
      return true

  stop_autoplay = ()->
    $.doTimeout 'autoplay'
    $.doTimeout  $slideshow_speed * 2, start_autoplay

  bannerIncrement = (direction)->
    if current_slide == 0 && direction == -1
      return (max_slide)
    else if current_slide == max_slide && direction == 1
      return 0
    else
      return current_slide + direction

  changeSlide = (slide, automatic)->
    $previously_active = $('.banners .banner.active')
    $active = $('.banners .banner').eq(slide)

    if $previously_active == $active then return false
    if is_transitioning then return false

    if automatic != true
      stop_autoplay()

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

  if $('.banners .banner').length > 1
    $('.banners').addClass('banner_slideshow')
    start_autoplay()

  $banner_dots.on 'click', ()->
    next_slide = $(this).data('slide')
    changeSlide(next_slide, false)

  $banner_arrows.on 'click', ()->
    direction = if $(this).hasClass('previous') then -1 else 1
    new_slide = bannerIncrement(direction)
    changeSlide(new_slide, false)

  # Contact Form

  clearErrors = ()->
    $('.errors').hide()
    $('.errors ul').html('')
  populateErrors = (response)->
    errorList = []
    for key of response.error
      errorList.push response.error[key][0] if response.error.hasOwnProperty(key)
    $.each errorList, (k,v)->
      $('.errors ul').append("<li>#{v}</li>")
    $('.errors').show()

  $("#contact form").submit (ev) ->
    ev.preventDefault()
    data = $(this).serialize()
    clearErrors()

    $.post "/", data, (response) ->
      if response.success
        $('form').hide()
        $(".success").show()
      else
        populateErrors(response)
      return

    return
