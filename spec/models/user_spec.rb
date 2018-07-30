require 'rails_helper'

RSpec.describe User, type: :model do

  let (:valid_user_params) {
    { first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest"
    }
  }

  let (:bad_user_params) {
    { first_name: "testgirl", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "x" }
  }

  describe ":: Create New User ::" do
    it "succeeds with valid params" do
      expect { User.create! valid_user_params }.to change { User.count }.by(1)
    end

    it "fails with invalid params" do
      expect { User.create! bad_user_params }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
