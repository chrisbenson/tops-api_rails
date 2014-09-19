class ApplicationController < ActionController::API

  #before_filter :set_locale_from_request

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from Exception, :with => :create_stacktrace_on_exception

  #def routing_error
  #  raise ActionController::RoutingError.new(params[:path])
  #end

  def debug?
    request.env['HTTP_PRAGMA'] == 'debug' ? true : false
  end

  protected

  def set_locale_from_request
    @locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}-[A-Z]{2}/).first
  end

  def is_a_valid_uuid?(uuid)
    uuid =~ /^[a-f0-9]{8}-[a-f0-9]{4}-4[a-f0-9]{3}-[a-f0-9]{4}-[a-f0-9]{12}$/ ? true : false
  end

  def create_stacktrace_on_exception(e)
    if self.debug?
      error_info = {
          :exception => "#{e.class.name} : #{e.message}",
      }
      error_info[:callstack] = e.backtrace
      render :json => error_info.to_json, :status => 500
    else
      render nothing: true, status: 500
    end
  end

  def record_not_found
    render :nothing, status: 404 # Not Found
  end

end
