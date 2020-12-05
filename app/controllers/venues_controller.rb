class VenuesController < ApplicationController
  def index
    if params[:capacity_threshold] && params[:capacity_threshold] != ""
      @venues = Venue.all.min_capacity(params[:capacity_threshold])
    else 
      @venues = Venue.all
    end
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
  end

  def create
    Venue.create(venue_params)
    redirect_to "/venues"
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    new_venue = Venue.find(params[:id])
    new_venue.update(venue_params)
    redirect_to "/venues/#{new_venue.id}"
  end

  def destroy
    Venue.destroy(params[:id])
    redirect_to '/venues'
  end

  private
  def venue_params
    params.permit(:name, :capacity, :outdoor)
  end

end
