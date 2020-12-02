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
end