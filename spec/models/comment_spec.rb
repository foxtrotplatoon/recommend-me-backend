require 'rails_helper'

RSpec.describe Comment, type: :model do

  let (:user) { User.create!(first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest") }

  let (:recc) { Recc.create!(name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", owner: user) }

  let (:valid_comment_params) {
    { comment_text: "This is a comment.", user: user, recc: recc }
  }

  let (:bad_comment_params_blank) {
    { comment_text: "", user: user}
  }

  describe ":: Create New Comment ::" do
    it "succeeds with valid params" do
      expect { Comment.create! valid_comment_params }.to change { Comment.count}.by(1)
    end

    it "fails with invalid params" do
      expect { Comment.create! bad_comment_params_blank }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
