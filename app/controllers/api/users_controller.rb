class Api::UsersController < ApiController
  def sync
    render json: {
             user_data: current_resource_owner,
             reccs_by_id: current_resource_owner.reccs
           }, status: 200
  end
end
