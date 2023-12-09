class SetScoresController < ApplicationController
  def index
    if (params[:year].nil? and params[:activity].nil?)
      @events = Event.order("id ASC")
    elsif (params[:year].nil? )
      @events = Event.where(activity: params[:activity]).order("id ASC")
    else
      @events = Event.where(year: params[:year]).order("id ASC")
    end
  end

  def update
    event = Event.find_by(id: params[:id])
    event.update(sharman: params[:sharman], winston: params[:winston], ennis: params[:ennis], turing: params[:turing])
  end
end
