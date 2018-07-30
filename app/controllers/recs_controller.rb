class RecsController < ApplicationController

  def new
  end

  private

  def set_var
    @rec = Rec.find(params[:id])
  end
end
