module ClientSideValidations
  module SimpleForm
    module FormBuilder

      def self.included(base)
        base.class_eval do
          def self.client_side_form_settings(options, form_helper)
            wrapper_object = ::SimpleForm.wrappers[options[:wrapper]] || ::SimpleForm.wrappers[::SimpleForm.default_wrapper]
            input_error = wrapper_object.find(:error).defaults
            wrapper = wrapper_object.defaults

            error_container_class = input_error[:class]
            input_error_tag = input_error[:tag]
            error_tag = wrapper[:class].join(" ")
            error_class = wrapper[:error_class]

            {
              :type => self.to_s,
              :error_class => [error_container_class, error_class].reject { |e| e.blank? }.join(" ."),
              :error_tag => input_error_tag,
              :wrapper_error_class => error_class,
              :wrapper_tag => ".#{error_tag}"
            }
          end
        end
      end # included
    end # FormBuilder
  end # SimpleForm
end # ClientSideValidations

SimpleForm::FormBuilder.send(:include, ClientSideValidations::SimpleForm::FormBuilder)
