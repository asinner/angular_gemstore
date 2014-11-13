class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Taken from http://stackoverflow.com/questions/14734243
  after_action :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  private

  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end
  
  def authenticate_admin!
    return render json: { msg: 'You must be authenticated to perform that action' }, status: 403 unless Admin.find_by(token: params[:token])
  end
end
