class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end
  
  def new

  end

  def create
    Band.create(name: params[:name], booked: params[:booked])
    redirect_to "/bands"
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    band = Band.find(params[:id])
    band.update(name: params[:name],
               booked: params[:booked])
    redirect_to "/bands/#{band.id}"
  end

  def destroy
    Band.destroy(params[:id])
    redirect_to "/bands"
  end
end