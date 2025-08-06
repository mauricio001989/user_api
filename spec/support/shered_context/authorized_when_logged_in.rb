shared_context 'with current user' do
  let(:current_user) { create(:user) }
end

shared_context 'http request' do
  before do
    request.headers.merge! current_user.create_new_auth_token
    http_request
  end
end

shared_context 'when current user authenticated is admin' do
  include_context 'with current user'
  before { current_user.roles << Role.find_by(name: 'admin') }
  include_context 'http request'
end

shared_context 'without authentication' do
  before { http_request }
end
