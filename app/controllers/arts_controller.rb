class ArtsController < ApplicationController

  respond_to :html, :json

  def index
    @arts = Art.all
    respond_with(@arts)
  end

  def playground
    if params[:search]
      @arts = Art.search(params[:search]).order("created_at DESC").limit(5)
      respond_with(@arts)
    end
  end


  def show
    @art = get_art
    respond_with(@art)
  end

  private

  def get_art
    Art.find(params[:id])
  end

end
