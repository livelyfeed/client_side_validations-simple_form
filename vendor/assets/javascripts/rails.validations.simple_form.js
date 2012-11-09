
/*
  Client Side Validations - SimpleForm - v1.5.0.beta.5
  https://github.com/dockyard/client_side_validations-simple_form

  Copyright (c) 2012 DockYard, LLC
  Licensed under the MIT license
  http://www.opensource.org/licenses/mit-license.php
*/


(function() {

  ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] = {
    add: function(element, settings, message) {
      var errorElement, wrapper;
      settings.wrapper_tag = ".control-group";
      settings.error_tag = "span";
      settings.error_class = "help-inline";
      settings.wrapper_error_class = "error";
      settings.wrapper_success = "success";
      if (element.data('valid') !== false) {
        wrapper = element.closest(settings.wrapper_tag);
        wrapper.removeClass(settings.wrapper_success);
        wrapper.addClass(settings.wrapper_error_class);
        errorElement = $("<" + settings.error_tag + "/>", {
          "class": settings.error_class,
          text: message
        });
        return wrapper.find(".controls").append(errorElement);
      } else {
        wrapper = element.closest(settings.wrapper_tag);
        wrapper.addClass(settings.wrapper_error_class);
        return element.parent().find("" + settings.error_tag + "." + settings.error_class).text(message);
      }
    },
    remove: function(element, settings) {
      var errorElement, wrapper;
      settings.wrapper_tag = ".control-group";
      settings.error_tag = "span";
      settings.error_class = "help-inline";
      settings.wrapper_error_class = "error";
      settings.wrapper_success = "success";
      wrapper = element.closest("" + settings.wrapper_tag + "." + settings.wrapper_error_class);
      wrapper.removeClass(settings.wrapper_error_class);
      errorElement = wrapper.find("" + settings.error_tag + "." + settings.error_class);
      return errorElement.remove();
    }
  };

}).call(this);
