require 'rails_helper'

RSpec.describe Recc, type: :model do

  let (:owner) { User.create!(first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest") }

  let (:valid_recc_params) {
    { name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", owner: owner }
  }

  let (:valid_recc_params_no_loc) {
    { name: "Weird Tree", description: "Come check out this weird tree", owner: owner }
  }

  let (:bad_recc_params) {
    { name: "Guh", description: "", owner: owner }
  }

  describe ":: Create New Recc ::" do
    it "succeeds with valid params" do
      expect { Recc.create! valid_recc_params }.to change { Recc.count  }.by(1)
      expect { Recc.create! valid_recc_params_no_loc }.to change { Recc.count }.by(1)
    end

    it "fails with invalid params" do
      expect { Recc.create! bad_recc_params  }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
