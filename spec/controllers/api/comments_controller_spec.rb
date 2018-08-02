require 'rails_helper'

RSpec.describe Api::CommentsController, type: :controller do
  render_views

  let (:user) { User.create!(first_name: "testboy", last_name: "testington", birthdate: "18/05/1989", email: "testboy@test.com", password: "testtest") }

  let (:recc) { Recc.create!(name: "Weird Tree", description: "Come check out this weird tree", location: "41.879591, -87.650078", owner: user) }

  let (:comment) { Comment.create!(comment_text: "This is a comment.", user: user, recc_id: recc.id )}

  let (:valid_comment_params) {
    { comment_text: "This is a comment.", user_id: user.id, recc_id: recc.id }
  }

  let (:bad_comment_params) {
    { comment_text: '', user_id: user.id, recc_id: recc.id }
  }

  describe "GET #show" do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'responds with 200' do
      current_comment = comment
      get :show, params: {id: current_comment.to_param}, :format => :json
      expect(response.status).to eq(200)
    end

    it 'returns a json object' do
      current_comment = comment
      get :show, params: {id: current_comment.to_param}, :format => :json
      expect(response.header['Content-Type']).to include('application/json')
    end
  end

  describe 'POST #create' do
    let(:token) { double :acceptable? => true }
    before do
      allow(controller).to receive_message_chain(:doorkeeper_token).and_return(token)
    end

    it 'creates a new comment with valid params' do
      expect {
        post :create, params: { comment: valid_comment_params }
      }.to change(Comment, :count).by(1)
    end

    it 'fails to create a new comment with invalid params' do
      expect {
        post :create, params: { comment: bad_comment_params }
      }.to change(Comment, :count).by(0)
    end
  end
end
