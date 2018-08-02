class Api::ReccsController < ApiController
  def show
    recc = Recc.find(params[:id])
    render json: recc
  end
end
