require 'rails_helper'

RSpec.describe Api::RatingsController, type: :controller do
  render_views

  let (:user) { User.create!(first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest") }

  let (:recc) { Recc.create!(name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", owner: user) }

  let (:valid_rating_params) {
    { score: 5, user_id: user.id, recc_id: recc.id }
  }

  let (:bad_rating_params) {
    { score: 'wonk', user_id: user.id, recc_id: recc.id }
  }

  let (:new_rating_params) {
    { score: 0, user_id: user.id, recc_id: recc.id }
  }

  describe "GET #show" do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'responds with 200' do
      current_rating = Rating.create! valid_rating_params
      get :show, params: {id: current_rating.to_param}, :format => :json
      expect(response.status).to eq(200)
    end

    it 'returns a json object' do
      current_rating = Rating.create! valid_rating_params
      get :show, params: {id: current_rating.to_param}, :format => :json
      expect(response.header['Content-Type']).to include('application/json')
    end
  end

  describe 'POST #create' do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'creates a new rating with valid params' do
      expect {
        post :create, params: { rating: valid_rating_params }
      }.to change(Rating, :count).by(1)
    end

    it 'fails to create a new rating with invalid params' do
      expect {
        post :create, params: { rating: bad_rating_params }
      }.to change(Rating, :count).by(0)
    end
  end

  describe 'PUT #update' do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'updates the requested rating' do
      rating = Rating.create! valid_rating_params

      put :update, params: {id: rating.to_param, rating: new_rating_params}

      rating.reload
      expect(rating.score).to eq(0)
    end
  end

  describe 'POST #destroy' do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'destroys the rating' do
      rating = Rating.create! valid_rating_params
      expect {
        delete :destroy, params: {id: rating.to_param}
      }.to change(Rating, :count).by(-1)
    end
  end
end
