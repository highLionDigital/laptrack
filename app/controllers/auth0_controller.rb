class Auth0Controller < ApplicationController
  def callback
    # OmniAuth stores the informatin returned from
    # Auth0 and the IdP in request.env['omniauth.auth'].
    # In this code, you will pull the raw_info supplied 
    # from the id_token and assign it to the session.
    # Refer to https://github.com/auth0/omniauth-auth0/blob/master/EXAMPLES.md#example-of-the-resulting-authentication-hash 
    # for complete information on 'omniauth.auth' contents.
    auth_info = request.env['omniauth.auth']
    session[:credentials] = {}
    session[:credentials][:id_token] = auth_info['credentials']['id_token']

    user = User.find_or_create_by(auth0_id: auth_info[:uid]) do |user|
      user.email = auth_info[:info][:email]
    end

    # Redirect to the URL you want after successful auth
    redirect_to my_profile_path
  end

  def failure
    # Handles failed authentication
    @error_msg = request.params['message']
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private
  AUTH0_CONFIG = Rails.application.config_for(:auth0)

  def logout_url
    request_params = {
      returnTo: root_url,
      client_id: AUTH0_CONFIG['auth0_client_id']
    }

    URI::HTTPS.build(host: AUTH0_CONFIG['auth0_domain'], path: '/v2/logout', query: request_params.to_query).to_s
  end
end