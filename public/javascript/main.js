(function() {
  $(document).ready(function() {
    var $age_confirmed, $forms, $header, $headlines, $list_items, $mobileClose, $mobileOpen, $navigation, $page_blocks, $pressed_button, $requirement_inputs, $trigger_requirements, ageGate, checkRequirements, clearErrors, populateErrors, selectForm, verifiedAge;
    $header = $('.header-container');
    $navigation = $('.navigation');
    $mobileOpen = $('.mobile-menu');
    $mobileClose = $('.mobile-close');
    $mobileOpen.on('click', function() {
      return $header.addClass('open');
    });
    $navigation.add($mobileClose).on('click', function() {
      return $header.removeClass('open');
    });
    $(window).resize(function() {
      return $header.removeClass('open');
    });
    $page_blocks = false;
    $headlines = $('.page-text-container h2, .shipping-group h3');
    $list_items = $('.page-content ul li .buy-reveal');
    $list_items.find('.faux-buy').click(function() {
      $list_items.filter('.active').removeClass('active');
      return $(this).parent().addClass('active');
    });
    $forms = $('.variant-form');
    selectForm = function() {
      var formValue;
      formValue = $('[name="vintage-list"]').val();
      $forms.filter('.current').removeClass('current');
      $('[data-sku="' + formValue + '"]').addClass('current');
    };
    $('[name="vintage-list"]').on('change', selectForm);
    selectForm();
    $headlines.on('click', function() {
      var $parent_block, $sibling_headings, $sibling_text, $sibling_text_class;
      $parent_block = $(this).parent();
      $sibling_headings = $parent_block.find('h2,h3');
      $sibling_text_class = $sibling_headings.first().next().attr('class');
      $sibling_text = $parent_block.find('.' + $sibling_text_class.split(' ').pop());
      if ($(this).hasClass('active')) {
        $(this).next().removeClass('active');
        $(this).removeClass('active');
      } else {
        $sibling_headings.removeClass('active');
        $sibling_text.removeClass('active');
        $(this).next().addClass('active');
        $(this).addClass('active');
      }
      if ($sibling_headings.filter('.active').length === 0) {
        return $sibling_headings.first().trigger('click');
      }
    });
    $('.page-text-container').each(function() {
      $(this).find('h2').each(function() {
        return $(this).nextUntil('h2').wrapAll('<div class="page-text-block" />');
      });
      $page_blocks = $('.page-text-block');
      return $(this).find('h2').eq(0).trigger('click');
    });
    $('.banners').slideshow({
      autoplay: true,
      dots: true,
      "class": 'banner_slideshow'
    });
    $('[data-gallery]').on('click', function() {
      return $.featherlight($(this).data('gallery'), {
        afterOpen: function() {
          return this.$content.find('.gallery').slideshow();
        }
      });
    });
    $('a[data-product]').on('click', function(e) {
      e.preventDefault();
      return $.featherlight($("[data-product='modal-" + ($(this).data('product')) + "']"));
    });
    $('.mc_embed_signup input[type=submit]').on('click', function() {
      return $.featherlight.close();
    });
    $pressed_button = false;
    $trigger_requirements = $('.buy:not(.unrestricted)');
    $requirement_inputs = $('.agreement input');
    $age_confirmed = $('.shipping-confirmation-confirm');
    ageGate = function(e) {
      if (!sessionStorage.getItem("verified")) {
        e.preventDefault();
        $pressed_button = $(e.currentTarget);
        return $.featherlight($('.shipping-confirmation'), {
          otherClose: '.close',
          closeIcon: '',
          beforeOpen: function() {
            return $('body').addClass('disable-scroll');
          },
          afterClose: function() {
            return $('body').removeClass('disable-scroll');
          }
        });
      }
    };
    checkRequirements = function(e) {
      if ($('.agreement input').filter(':checked').length === 2) {
        return $('.shipping-confirmation-confirm').attr('disabled', false);
      } else {
        return $('.shipping-confirmation-confirm').attr('disabled', 'disabled');
      }
    };
    verifiedAge = function() {
      sessionStorage.setItem("verified", true);
      return $pressed_button.trigger('click');
    };
    $trigger_requirements.on('click', ageGate);
    $requirement_inputs.on('change', checkRequirements);
    $age_confirmed.on('click', verifiedAge);
    clearErrors = function() {
      $('.errors').hide();
      return $('.errors ul').html('');
    };
    populateErrors = function(response) {
      var errorList, key;
      errorList = [];
      for (key in response.error) {
        if (response.error.hasOwnProperty(key)) {
          errorList.push(response.error[key][0]);
        }
      }
      $.each(errorList, function(k, v) {
        return $('.errors ul').append("<li>" + v + "</li>");
      });
      return $('.errors').show();
    };
    return $("#contact form").submit(function(ev) {
      var data;
      ev.preventDefault();
      data = $(this).serialize();
      clearErrors();
      $.post("/", data, function(response) {
        if (response.success) {
          $('form').hide();
          $(".success").show();
        } else {
          populateErrors(response);
        }
      });
    });
  });

}).call(this);
