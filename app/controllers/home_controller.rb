class HomeController < ApplicationController
  before_filter :login_required, :except => :bye

  def index
    @current_user = session[:user_id]
  end
end
