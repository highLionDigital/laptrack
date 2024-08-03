class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :require_login
  helper_method :user_signed_in?

  private

  def user_signed_in?
    session[:credentials].present? && session[:credentials][:id_token].present?
  end

  def require_login
    return if current_user

    redirect_post('/auth/auth0', params: { prompt: 'login' },
      options: { method: :post, authenticity_token: 'auto' })
  end

  def current_user
    decoded_id_token if session[:credentials]
  end

  def decoded_id_token
    JWT.decode(session[:credentials][:id_token], nil, false)[0].deep_symbolize_keys
  end
end
