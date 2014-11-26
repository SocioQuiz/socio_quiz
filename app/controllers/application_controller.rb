class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#  protect_from_forgery
  before_filter :set_locale#, :set_no_cache
##def set_no_cache
##  response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
##  response.headers["Pragma"] = "no-cache"
##  response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
##end
  private
  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
  end
end
