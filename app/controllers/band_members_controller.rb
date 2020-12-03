class BandMembersController < ApplicationController

  def index
    @band= Band.find(params[:id])
  end
end