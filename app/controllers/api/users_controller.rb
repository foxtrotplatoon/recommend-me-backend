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

    def load_proposal_and_comments
      proposal_array = []
      current_resource_owner.proposals.each do |proposal|
        mini_proposal_array = []
        mini_proposal_array.push(proposal)
        mini_proposal_array.push(Recc.find(proposal.id).comments)
        proposal_array.push(mini_proposal_array)
      end
      return proposal_array
    end

    render json: {
             user_data: current_resource_owner,
             user_data_all: User.all,
             user_reccs: load_recc_and_comments,
             user_ratings: current_resource_owner.ratings,
             user_comments: current_resource_owner.comments,
             user_proposals: load_proposal_and_comments
           }, status: 200
  end

  def sync_all
    complete_users_array = User.all
    render json: {
             complete_users_array: complete_users_array
           }
  end
end
