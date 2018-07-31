require 'rails_helper'

RSpec.describe Rating, type: :model do

  let (:user) { User.create!(first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest") }

  let (:recc) { Recc.create!(name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", owner: user) }

  let (:valid_rating_params) {
    { score: 3, user: user, recc: recc  }
  }

  let (:bad_rating_params_not_int) {
    { score: 'wonk', user: user }
  }

  let (:bad_rating_params_too_high) {
    { score: 19, user: user }
  }

  let (:bad_rating_params_below_zero) {
    { score: -5, user: user }
  }

  describe ":: Create New Rating ::" do
    it "succeeds with valid params" do
      expect { Rating.create! valid_rating_params }.to change { Rating.count }.by(1)
    end

    it "fails when score is not an integer" do
      expect { Rating.create! bad_rating_params_not_int }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "fails when score is higher than 5" do
      expect { Rating.create! bad_rating_params_too_high }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "fails when the score is below 0" do
      expect { Rating.create! bad_rating_params_below_zero }.to raise_error(ActiveRecord::RecordInvalid)
    end
    end
end
