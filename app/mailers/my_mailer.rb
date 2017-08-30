class MyMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`
  default template_path: 'devise/mailer' # to make sure that your mailer uses the devise views

  def self.included(base)
    base.default_url_options = ActionMailerWithRequest::OptionsProxy.new(base.default_url_options)
  end
end