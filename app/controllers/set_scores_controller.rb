class SetScoresController < ApplicationController
  def index
    if (params[:year].nil?)
      @events = Event.order("id ASC")
    else
      @events = Event.where(year: params[:year]).order("id ASC")
    end
  end

  def update
    event = Event.find_by(id: params[:id])
    event.update(sharman: params[:sharman], winston: params[:winston], ennis: params[:ennis], turing: params[:turing])
    ActionCable.server.broadcast("update_scores_channel", event.to_json)
    redirect_to "/set_score"
  end
end
