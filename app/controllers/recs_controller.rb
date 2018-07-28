class RecsController < ApplicationController

  def new
  end

  private

  def set_rec
    @rec = Rec.find(params[:id])
  end
end
