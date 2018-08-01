class Api::UsersController < ApiController
  def sync
    render json: {
             user_data: current_resource_owner,
             user_reccs: current_resource_owner.reccs,
             user_ratings: current_resource_owner.ratings,
             user_comments: current_resource_owner.comments
           }, status: 200
  end
end
