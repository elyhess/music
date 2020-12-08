class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(name: params[:name], instrument: params[:instrument])
    redirect_to members_show_path(@member.id)
  end

  def destroy
    Member.destroy(params[:id])
    redirect_to members_path
  end
end