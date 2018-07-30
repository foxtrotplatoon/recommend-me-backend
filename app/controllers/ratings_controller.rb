class RatingsController < ApplicationController

  def new
  end

  private

  def set_var
    @rating = Rating.find(params[:id])
  end
end
