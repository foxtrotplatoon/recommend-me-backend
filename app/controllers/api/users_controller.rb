class Api::UsersController < ApiController
  
  def sync
    def load_recc_and_comments
      recc_array = []
      current_resource_owner.reccs.each do |recc|
        mini_recc_array = []
        mini_recc_array.push(recc)
        mini_recc_array.push(recc.comments)
        recc_array.push(mini_recc_array)
      end
      return recc_array
    end

    render json: {
             user_data: current_resource_owner,
             user_reccs: load_recc_and_comments,
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
