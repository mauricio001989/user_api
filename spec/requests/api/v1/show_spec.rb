require 'rails_helper'

RSpec.describe "GET #Show", type: :request do
  subject(:request) { get "/api/v1/users/#{id}", headers: }

  let(:users) { create_list(:user, 3) }
  let(:id) { users.last.id }

  describe 'when user is authenticated' do
    include_context 'admin request'
    include_examples 'expect specific HTTP status', :ok

    it 'returns the requested user' do
      expect(json_response['id']).to eq(id)
    end
  end

  describe 'when user is not authenticated' do
    include_context 'unauthenticated request'
    include_examples 'expect specific HTTP status', :unauthorized
  end
end
