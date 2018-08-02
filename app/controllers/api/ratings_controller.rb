class Api::RatingsController < ApiController
  def show
    rating = Rating.find(params[:id])
    render json: rating
  end

  def create
    rating = Rating.create(rating_params)
    render json: rating
  end

  def destroy
    Rating.destroy(params[:id])
  end

  def update
    rating = Rating.find(params[:id])
    rating.update_attributes(rating_params)
    render json: rating
  end

  private

  def rating_params
    params.require(:rating).permit(:score, :user_id, :recc_id)
  end
end
