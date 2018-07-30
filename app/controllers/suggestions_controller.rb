class SuggestionsController < ApplicationController

  def new
  end

  private

  def set_var
    @suggestion = Suggestion.find(params[:id])
  end
end
