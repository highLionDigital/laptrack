class PagesController < ApplicationController
  def home
    @user = session[:userinfo]
  end
end
