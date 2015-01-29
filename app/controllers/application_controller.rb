class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :correct_safari_and_ie_accept_headers
  after_filter :set_xhr_flash
  protect_from_forgery with: :exception
  before_action :recent_sermons
  include SessionsHelper

  def set_xhr_flash
	  flash.discard if request.xhr?
	end

  def recent_sermons
    @sermons_recent = Sermon.recent
  end

	def correct_safari_and_ie_accept_headers
	  ajax_request_types = ['text/javascript', 'application/json', 'text/xml']
	  request.accepts.sort! { |x, y| ajax_request_types.include?(y.to_s) ? 1 : -1 } if request.xhr?
	end
end
