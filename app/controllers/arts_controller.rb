class ArtsController < ApplicationController

  respond_to :html, :json

  def index
      @arts = Art.all
      respond_with(@arts)
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
