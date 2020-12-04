class BandMembersController < ApplicationController

  def index
    @band = Band.find(params[:id])
  end

  def new
    @band = Band.find(params[:id])
  end

  def create
    @band = Band.find(params[:id])
    @band.members.create(name: params[:name], instrument: params[:instrument])
    redirect_to "/bands/#{@band.id}/members"
  end
end