shared_context 'with current user' do
  let(:current_user) { create(:user) }
end

shared_context 'with admin user' do
  include_context 'with current user'
  before { current_user.roles << Role.find_by(name: 'admin') }
end

shared_context 'with authentication headers' do
  let(:headers) { current_user.create_new_auth_token }
end

shared_context 'authenticated request' do
  include_context 'with authentication headers'
  before { request }
end

shared_context 'admin request' do
  include_context 'with admin user'
  include_context 'with authentication headers'
  before { request }
end

shared_context 'unauthenticated request' do
  before { request }
end
