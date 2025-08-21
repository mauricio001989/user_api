require 'rails_helper'

RSpec.describe "PATCH #Update", type: :request do
  subject(:request) { patch "/api/v1/users/#{id}", params:, headers: }

  let(:users) { create_list(:user, 3) }
  let(:id) { users.last.id }
  let(:params) { {  name: 'new name' } }

  describe 'when user is authenticated' do
    include_context 'admin request'
    include_examples 'expect specific HTTP status', :ok

    it 'updates the requested user' do
      expect(User.find(id).name).to eq("new name")
    end

    it 'returns the updated user' do
      expect(json_response['name']).to eq("new name")
    end
  end

  describe 'when user is not authenticated' do
    include_context 'unauthenticated request'
    include_examples 'expect specific HTTP status', :unauthorized
  end
end
