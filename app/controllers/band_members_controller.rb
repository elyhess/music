class BandMembersController < ApplicationController

  def index
    @band = Band.find(params[:id])
    if params[:sort]
      @members = @band.members.order_by_alphabetical
    else
      @members = @band.members
    end
  end

  def new
    @band = Band.find(params[:id])
  end

  def create
    @band = Band.find(params[:id])
    @band.members.create(name: params[:name], instrument: params[:instrument])
    redirect_to band_members_path(@band.id)
  end
end