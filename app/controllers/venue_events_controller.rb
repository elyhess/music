class VenueEventsController < ApplicationController
  def index
    @venue = Venue.find(params[:id])
  end
end