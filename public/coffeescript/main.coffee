$(document).ready ->

  $header = $('.header-container')
  $navigation = $('.navigation')
  $mobileOpen = $('.mobile-menu')
  $mobileClose = $('.mobile-close')

  $mobileOpen.on 'click', ()->
    $header.addClass('open')

  $navigation.add($mobileClose).on 'click', ()->
    $header.removeClass('open')

  $(window).resize ()->
    $header.removeClass('open')

  $page_blocks = false
  $headlines = $('.page-text-container h2, .shipping-group h3')

  # Ensure that product reveals does show price
  $list_items = $('.page-content ul li .buy-reveal')
  $list_items.find('.faux-buy').click ()->
    $list_items.filter('.active').removeClass 'active'
    $(@).parent().addClass 'active'

  # Make each section active when clicked
  $headlines.on 'click', ()->
    $parent_block = $(this).parent()

    $sibling_headings = $parent_block.find('h2,h3')
    $sibling_text_class = $sibling_headings.first().next().attr('class')

    $sibling_text = $parent_block.find('.' + $sibling_text_class.split(' ').pop())

    if $(this).hasClass('active')
      $(this).next().removeClass('active')
      $(this).removeClass('active')
    else
      $sibling_headings.removeClass('active')
      $sibling_text.removeClass('active')
      $(this).next().addClass('active')
      $(this).addClass('active')

    # Open Default
    if $sibling_headings.filter('.active').length == 0
      $sibling_headings.first().trigger 'click'

  # Wrap content for collapsing content areas
  $('.page-text-container').each ()->
    $(this).find('h2').each ()->
      $(this).nextUntil('h2').wrapAll('<div class="page-text-block" />')
    $page_blocks = $('.page-text-block')

    $(this).find('h2').eq(0).trigger('click')


  $('.banners').slideshow({
    autoplay: true,
    dots: true,
    class: 'banner_slideshow'
  })

  $('[data-gallery]').on 'click', ()->
    $.featherlight $(this).data('gallery'),
      afterOpen: ()->
        @$content.find('.gallery').slideshow()

  $('a[data-product]').on 'click', (e)->
    e.preventDefault()
    $.featherlight $("[data-product='modal-#{$(this).data('product')}']")

  $('.mc_embed_signup input[type=submit]').on 'click', ()->
    $.featherlight.close()

  # Age Requirement Form
  $pressed_button = false
  $trigger_requirements = $('.buy:not(.unrestricted)')
  $requirement_inputs = $('.agreement input')
  $age_confirmed = $('.shipping-confirmation-confirm')

  ageGate = (e)->
    if !sessionStorage.getItem("verified")
      e.preventDefault()
      $pressed_button = $(e.currentTarget)

      $.featherlight $('.shipping-confirmation'),
        otherClose: '.close'
        closeIcon: ''

  checkRequirements = (e)->
    if $('.agreement input').filter(':checked').length == 2
      $('.shipping-confirmation-confirm').attr('disabled',false)
    else
      $('.shipping-confirmation-confirm').attr('disabled','disabled')

  verifiedAge = ()->
    # Set session
    sessionStorage.setItem("verified", true)
    # Resume action
    $pressed_button.trigger 'click'

  $trigger_requirements.on 'click', ageGate
  $requirement_inputs.on 'change', checkRequirements
  $age_confirmed.on 'click', verifiedAge

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
