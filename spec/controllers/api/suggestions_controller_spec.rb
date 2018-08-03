require 'rails_helper'

RSpec.describe Api::SuggestionsController, type: :controller do
  render_views

  let (:user) { User.create!(first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest") }

  let (:user_2) { User.create!(first_name: 'testgirl', last_name: 'testington', birthdate: "01/03/2010", email: 'testgirl@test.com', password: 'testtest') }

  let (:recc) { Recc.create!(name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", owner: user) }

  let (:valid_suggestion_params) {
    { suggestion_comment: "Check out this tree", recipient_id: user_2.id, proposal_id: recc.id }
  }

  let (:bad_suggestion_params) {
    { suggestion_comment: "Bad comment", recipient_id: user_2.id, proposal_id: nil }
  }

  let (:new_suggestion_params) {
    { suggestion_comment: "NEW TEXT", recipient_id: user_2.id, proposal_id: recc.id }
  }

  describe "GET #show" do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'responds with 200' do
      current_suggestion = Suggestion.create! valid_suggestion_params
      get :show, params: {id: current_suggestion.to_param}, :format => :json
      expect(response.status).to eq(200)
    end

    it 'returns a json object' do
      current_suggestion = Suggestion.create! valid_suggestion_params
      get :show, params: {id: current_suggestion.to_param}, :format => :json
      expect(response.header['Content-Type']).to include('application/json')
    end
  end

  describe 'POST #create' do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'creates a new suggestion with valid params' do
      expect {
        post :create, params: { suggestion: valid_suggestion_params }
      }.to change(Suggestion, :count).by(1)
    end

    it 'fails to create a new suggestion with invalid params' do
      expect {
        post :create, params: { suggestion: bad_suggestion_params }
      }.to change(Suggestion, :count).by(0)
    end
  end

  describe 'PUT #update' do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'updates the requested suggestion' do
      suggestion = Suggestion.create! valid_suggestion_params

      put :update, params: {id: suggestion.to_param, suggestion: new_suggestion_params}

      suggestion.reload
      expect(suggestion.suggestion_comment).to eq("NEW TEXT")
    end
  end

  describe 'POST #destroy' do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'destroys the suggestion' do
      suggestion = Suggestion.create! valid_suggestion_params
      expect {
        delete :destroy, params: {id: suggestion.to_param}
      }.to change(Suggestion, :count).by(-1)
    end
  end
end
