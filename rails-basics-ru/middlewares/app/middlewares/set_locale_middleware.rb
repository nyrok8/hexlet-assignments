# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    request = Rack::Request.new(env)
    Rails.logger.debug "* Accept-Language: #{request.env['HTTP_ACCEPT_LANGUAGE']}"

    locale = extract_locale_from_accept_language_header(request) || I18n.default_locale

    Rails.logger.debug "* Locale set to '#{locale}'"
    I18n.locale = locale
    @app.call(env)
  end

  private

  def extract_locale_from_accept_language_header(request)
    request.env['HTTP_ACCEPT_LANGUAGE']&.scan(/^[a-z]{2}/)&.first
  end
  # END
end
