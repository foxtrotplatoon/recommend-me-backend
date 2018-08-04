require 'rails_helper'

RSpec.describe Api::ReccsController, type: :controller do
  let (:user) { User.create!(first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest") }

  let (:valid_recc_params) {
    { name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", user_id: user.id }
  }

  describe 'POST #create' do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'creates a new recc with valid params' do
      expect {
        post :create, params: { recc: valid_recc_params }
      }.to change(Recc, :count).by(1)
    end
  end
end
