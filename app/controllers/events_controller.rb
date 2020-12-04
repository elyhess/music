class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(name: params[:name])
    redirect_to "/events/#{@event.id}"
  end

  def destroy
    Event.destroy(params[:id])
    redirect_to "/events"
  end
end