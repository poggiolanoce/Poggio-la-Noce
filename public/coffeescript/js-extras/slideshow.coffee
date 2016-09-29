(($, window, document) ->

  pluginName = 'slideshow'
  defaults =
    dots: false,
    autoplay: false,
    slideshow_speed: 4000,
    class: false

  Slideshow = (element, options) ->
    @element = $(element)

    @settings = $.extend({}, defaults, options)
    @_defaults = defaults
    @_name = pluginName

    @max_slide = 0
    @current_slide = 0
    @is_transitioning = false

    @banner_dots = $('.dots li')
    @banner_arrows = $('.arrows li')

    @start_autoplay = ()=>
      $.doTimeout 'autoplay', @settings.slideshow_speed, ()=>
        @changeSlide(@bannerIncrement(1), true)
        return true

    @stop_autoplay = ()=>
      $.doTimeout 'autoplay'
      $.doTimeout  @settings.slideshow_speed * 2, @start_autoplay

    @bannerIncrement = (direction)->
      if @current_slide == 0 && direction == -1
        return (@max_slide)
      else if @current_slide == @max_slide && direction == 1
        return 0
      else
        return @current_slide + direction

    @changeSlide = (slide, automatic)->
      $previously_active = @element.children('.slide.active')
      $active = @element.children('.slide').eq(slide)

      if $previously_active == $active then return false
      if @is_transitioning then return false

      if automatic != true && @settings.autoplay
        @stop_autoplay()


      @is_transitioning = true
      @current_slide = slide

      @banner_dots.filter('.active').removeClass('active')
      @banner_dots.eq(slide).addClass('active')

      $previously_active.removeClass('active').addClass('previously_active')
      $active.addClass('active')

      if @settings.autoplay
        setTimeout @finishChangeslide, 1000
      else
        @finishChangeslide()

    @finishChangeslide = ()=>
      $('.previously_active').removeClass('previously_active')
      @is_transitioning = false

    @handleDotEvent = (e)=>
      next_slide = $(e.currentTarget).data('slide')
      @changeSlide(next_slide, false)

    @handleArrowEvent = (e)=>
      direction = if $(e.currentTarget).hasClass('previous') then -1 else 1
      new_slide = @bannerIncrement(direction)
      @changeSlide(new_slide, false)

    @init()
    return


  Slideshow::init = ->
    # Place initialization logic here
    # You already have access to the DOM element and
    # the options via the instance, e.g. this.element
    # and this.options
    @max_slide = @element.children('.slide').length - 1

    if @max_slide < 1
      return

    if @settings.class
      @element.addClass(@settings.class)

    if @settings.autoplay
      @start_autoplay()

    @banner_dots.on 'click', @handleDotEvent

    @banner_arrows.on 'click', @handleArrowEvent

    return

  # A really lightweight plugin wrapper around the constructor,
  # preventing against multiple instantiations

  $.fn[pluginName] = (options) ->
    @each ->
      if !$.data(this, 'plugin_' + pluginName)
        $.data this, 'plugin_' + pluginName, new Slideshow(this, options)
      return

  return
) jQuery, window, document
