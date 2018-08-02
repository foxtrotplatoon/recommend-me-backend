require 'rails_helper'

RSpec.describe Suggestion, type: :model do

  let (:user) { User.create!(first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest") }

  let (:recc) { Recc.create!(name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", owner: user) }

  let (:valid_suggestion_params) {
    { suggestion_comment: "Check out this tree", recipient: user, proposal: recc }
  }

  let (:bad_suggestion_params) {
    { suggestion_comment: "Check out this tree", recipient: '', proposal: recc }
  }

  describe ":: Create New Suggestion ::" do
    it "succeeds with valid params" do
      expect { Suggestion.create! valid_suggestion_params }.to change { Suggestion.count }.by(1)
    end

    it "fails with invalid params" do
      expect { Suggestion.create! bad_suggestion_params }.to raise_error(ActiveRecord::AssociationTypeMismatch)
    end
  end
end
