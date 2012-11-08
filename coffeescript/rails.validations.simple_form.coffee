###
  Client Side Validations - SimpleForm - v<%= ClientSideValidations::SimpleForm::VERSION %>
  https://github.com/dockyard/client_side_validations-simple_form

  Copyright (c) <%= DateTime.now.year %> DockYard, LLC
  Licensed under the MIT license
  http://www.opensource.org/licenses/mit-license.php
###

ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] =
#  add: (element, settings, message) ->
#    if element.data('valid') != false
#      wrapper = element.closest(settings.wrapper_tag)
#      wrapper.addClass(settings.wrapper_error_class)
#      errorElement = $("<#{settings.error_tag}/>", { class: settings.error_class, text: message })
#      wrapper.append(errorElement)
#    else
#      element.parent().find("#{settings.error_tag}.#{settings.error_class}").text(message)
#
#  remove: (element, settings) ->
#    wrapper = element.closest("#{settings.wrapper_tag}.#{settings.wrapper_error_class}")
#    wrapper.removeClass(settings.wrapper_error_class)
#    errorElement = wrapper.find("#{settings.error_tag}.#{settings.error_class}")
#    errorElement.remove()

  add: (element, settings, message) ->
    settings.wrapper_tag = ".control-group"
    settings.error_tag = "span"
    settings.error_class = "help-inline"
    settings.wrapper_error_class = "error"
    settings.wrapper_success = "success"

    if element.data('valid') != false
      wrapper = element.closest(settings.wrapper_tag)
      wrapper.removeClass(settings.wrapper_success)
      wrapper.addClass(settings.wrapper_error_class)
      errorElement = $("<#{settings.error_tag}/>", {
        "class": settings.error_class,
        text: message
      })

      wrapper.find(".controls").append(errorElement)
    else
      wrapper = element.closest(settings.wrapper_tag)
      wrapper.addClass(settings.wrapper_error_class)

      element.parent().find("#{settings.error_tag}.#{settings.error_class}").text(message)

  remove: (element, settings) ->
    settings.wrapper_tag = ".control-group"
    settings.error_tag = "span"
    settings.error_class = "help-inline"
    settings.wrapper_error_class = "error"
    settings.wrapper_success = "success"

    wrapper = element.closest("#{settings.wrapper_tag}.#{settings.wrapper_error_class}")
    wrapper.removeClass(settings.wrapper_error_class)
    wrapper.addClass(settings.wrapper_success)
    errorElement = wrapper.find("#{settings.error_tag}.#{settings.error_class}")

    errorElement.remove()
