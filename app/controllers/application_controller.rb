class ApplicationController < ActionController::Base
  helper_method :current_user

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
