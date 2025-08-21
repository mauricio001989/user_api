require 'rails_helper'

RSpec.describe "GET #Index", type: :request do
  before { create_list(:user, 3) }

  subject(:request) { get "/api/v1/users", headers: }

  describe 'when user is authenticated' do
    include_context 'admin request'
    include_examples 'expect specific HTTP status', :ok
    include_context 'validate response count', 'users', 4
  end

  describe 'when user is not authenticated' do
    include_context 'unauthenticated request'
    include_examples 'expect specific HTTP status', :unauthorized
  end
end
