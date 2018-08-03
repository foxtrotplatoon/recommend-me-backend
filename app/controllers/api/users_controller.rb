class Api::UsersController < ApiController
  
  def sync
    render json: {
             user_data: current_resource_owner,
             user_reccs: current_resource_owner.reccs,
             user_ratings: current_resource_owner.ratings,
             user_comments: current_resource_owner.comments,
             user_proposals: current_resource_owner.proposals
           }, status: 200
  end

  def sync_all
    complete_users_array = User.all
    render json: {
             complete_users_array: complete_users_array
           }
  end
end
