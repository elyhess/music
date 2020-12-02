class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
  end

  def create
    Venue.create(name: params[:name],
                 capacity: params[:capacity],
                 outdoor: params[:outdoor])
    redirect_to "/venues"
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    new_venue = Venue.find(params[:id])
    new_venue.update(name: params[:name],
                 capacity: params[:capacity],
                 outdoor: params[:outdoor])
    redirect_to "/venues/#{new_venue.id}"
  end
end
