$(document).ready ->
  $page_blocks = false
  $headlines = $('.page-text-container h2, .shipping-group h3')

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

  # Wrap content for collapsing content areas
  $('.page-text-container').each ()->
    $(this).find('h2').each ()->
      $(this).nextUntil('h2, .add-to-cart').wrapAll('<div class="page-text-block" />')
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

  $.featherlight $('.shipping-confirmation'),
    otherClose: '.close'
    closeIcon: ''

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
