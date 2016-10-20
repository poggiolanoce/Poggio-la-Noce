(function() {
  (function($, window, document) {
    var Slideshow, defaults, pluginName;
    pluginName = 'slideshow';
    defaults = {
      dots: false,
      autoplay: false,
      slideshow_speed: 4000,
      "class": false
    };
    Slideshow = function(element, options) {
      var video_players;
      this.element = $(element);
      this.settings = $.extend({}, defaults, options);
      this._defaults = defaults;
      this._name = pluginName;
      this.max_slide = 0;
      this.current_slide = 0;
      this.is_transitioning = false;
      this.banner_dots = $('.dots li');
      this.banner_arrows = $('.arrows li');
      video_players = [];
      this.start_autoplay = (function(_this) {
        return function() {
          return $.doTimeout('autoplay', _this.settings.slideshow_speed, function() {
            _this.changeSlide(_this.bannerIncrement(1), true);
            return true;
          });
        };
      })(this);
      this.stop_autoplay = (function(_this) {
        return function() {
          $.doTimeout('autoplay');
          return $.doTimeout(_this.settings.slideshow_speed * 2, _this.start_autoplay);
        };
      })(this);
      this.bannerIncrement = function(direction) {
        if (this.current_slide === 0 && direction === -1) {
          return this.max_slide;
        } else if (this.current_slide === this.max_slide && direction === 1) {
          return 0;
        } else {
          return this.current_slide + direction;
        }
      };
      this.changeSlide = function(slide, automatic) {
        var $active, $old_video, $previously_active, player;
        $previously_active = this.element.children('.slide.active');
        $active = this.element.children('.slide').eq(slide);
        if ($previously_active === $active) {
          return false;
        }
        if (this.is_transitioning) {
          return false;
        }
        if (automatic !== true && this.settings.autoplay) {
          this.stop_autoplay();
        }
        $old_video = $previously_active.find('iframe');
        if ($old_video.length > 0) {
          player = video_players[$old_video.data('index')];
          player.stopVideo();
        }
        this.is_transitioning = true;
        this.current_slide = slide;
        this.banner_dots.filter('.active').removeClass('active');
        this.banner_dots.eq(slide).addClass('active');
        $previously_active.removeClass('active').addClass('previously_active');
        $active.addClass('active');
        if (this.settings.autoplay) {
          return setTimeout(this.finishChangeslide, 1000);
        } else {
          return this.finishChangeslide();
        }
      };
      this.finishChangeslide = (function(_this) {
        return function() {
          $('.previously_active').removeClass('previously_active');
          _this.is_transitioning = false;
          return _this.autoplayVideo();
        };
      })(this);
      this.autoplayVideo = (function(_this) {
        return function() {
          var $new_video, player, player_ref;
          $new_video = _this.element.children('.active').find('iframe');
          player_ref = video_players[$new_video.data('index')];
          if (player_ref) {
            player_ref.playVideo();
          }
          if ($new_video.length > 0 && !player_ref) {
            player = new YT.Player($new_video.get(0), {
              events: {
                'onReady': _this.onPlayerReady
              }
            });
            return video_players.push(player);
          }
        };
      })(this);
      this.onPlayerReady = (function(_this) {
        return function(event) {
          return event.target.playVideo();
        };
      })(this);
      this.handleDotEvent = (function(_this) {
        return function(e) {
          var next_slide;
          next_slide = $(e.currentTarget).data('slide');
          return _this.changeSlide(next_slide, false);
        };
      })(this);
      this.handleArrowEvent = (function(_this) {
        return function(e) {
          var direction, new_slide;
          direction = $(e.currentTarget).hasClass('previous') ? -1 : 1;
          new_slide = _this.bannerIncrement(direction);
          return _this.changeSlide(new_slide, false);
        };
      })(this);
      this.init();
    };
    Slideshow.prototype.init = function() {
      this.autoplayVideo();
      this.max_slide = this.element.children('.slide').length - 1;
      if (this.max_slide < 1) {
        return;
      }
      if (this.settings["class"]) {
        this.element.addClass(this.settings["class"]);
      }
      if (this.settings.autoplay) {
        this.start_autoplay();
      }
      this.banner_dots.on('click', this.handleDotEvent);
      this.banner_arrows.on('click', this.handleArrowEvent);
    };
    $.fn[pluginName] = function(options) {
      return this.each(function() {
        if (!$.data(this, 'plugin_' + pluginName)) {
          $.data(this, 'plugin_' + pluginName, new Slideshow(this, options));
        }
      });
    };
  })(jQuery, window, document);

}).call(this);
