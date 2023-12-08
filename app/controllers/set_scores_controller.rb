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
    ActionCable.server.broadcast("update_scores_channel", {
      year: event.year,
      sharman: Event.where(year: event.year).sum(:sharman),
      turing: Event.where(year: event.year).sum(:turing),
      winston: Event.where(year: event.year).sum(:winston),
      ennis: Event.where(year: event.year).sum(:ennis)
    })
  end
end
