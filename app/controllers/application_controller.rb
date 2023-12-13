class ApplicationController < ActionController::Base
  include ActionController::Cookies
  before_action :set_paper_trail_whodunnit

  def current_user
    session[:grant]["user"]["email"]
  end
end
