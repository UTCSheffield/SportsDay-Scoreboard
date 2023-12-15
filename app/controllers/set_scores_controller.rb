class SetScoresController < ApplicationController
  include UserRoles
  before_action :authorize_scorer
  skip_before_action :verify_authenticity_token if Rails.env.development?
  def index
    if (params[:year].nil? and params[:activity].nil?)
      @events = Event.order("id ASC")
    elsif (params[:year].nil? )
      @events = Event.where(activity: params[:activity]).order("id ASC")
    else
      @events = Event.where(year: params[:year]).order("id ASC")
    end
    @activities = Event.where(year: 9, gender: "Boys").order("id ASC") # This could use any year and gender, I just went for Y9 & boy because it's the fewest characters
  end

  def update
    event = Event.find_by(id: params[:id])
    event.update(sharman: params[:sharman], winston: params[:winston], ennis: params[:ennis], turing: params[:turing])
  end
end
