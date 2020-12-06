class VenueEventsController < ApplicationController

  def index
    @venue = Venue.find(params[:id])
    if params[:sort]
      @events = @venue.events.sort_alphabetically
    else 
      @events = @venue.events
    end
  end

  def new 
    @venue = Venue.find(params[:id])
  end

  def create
    @venue = Venue.find(params[:id])
    @venue.events.create(name: params[:name])
    redirect_to "/venues/#{@venue.id}/events"
  end
end