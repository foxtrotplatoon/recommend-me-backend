class Api::ReccsController < ApiController
  def show
    recc = Recc.find(params[:id])
    render json: recc
  end

  def create
    recc = Recc.create(recc_params)
    render json: recc
  end

  def destroy
    Recc.destroy(params[:id])
  end

  def update
    recc = Recc.find(params[:id])
    recc.update_attributes(recc_params)
    render json: recc
  end

  def sync_comments
    recc = Recc.find(params[:id]).comments
    render json: {
             recc_comments: recc.comments
           }, status: 200
  end

  private

  def recc_params
    params.require(:recc).permit(:id, :name, :description, :location, :user_id)
  end
end
