class Api::UsersController < ApiController
  def sync
    render json: current_resource_owner.reccs, status: 200
  end
end
