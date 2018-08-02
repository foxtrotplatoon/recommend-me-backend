class Api::SuggestionsController < ApiController
  def show
    suggestion = Suggestion.find(params[:id])
    render json: suggestion
  end

  def create
    suggestion = Suggestion.create(suggestion_params)
    render json: suggestion
  end

  def destroy
    Suggestion.destroy(params[:id])
  end

  def update
    suggestion = Suggestion.find(params[:id])
    suggestion.update_attributes(suggestion_params)
    render json: suggestion
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:suggestion_comment, :recipient, :proposal)
  end
end
