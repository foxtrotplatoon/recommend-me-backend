class Api::UsersController < ApiController
  def sync
    render json: current_resource_owner, status: 200
  end
end
