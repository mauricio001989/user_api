require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let!(:users) { create_list(:user, 3) }
  let(:user_id) { users.last.id }

  describe 'GET #index' do
    subject(:http_request) { get :index }

    context 'when user is authenticated' do
      include_context 'when current user authenticated is admin'
      include_examples 'expect specific HTTP status', :ok
      include_context 'validate response count', 'users', 4
    end

    context 'when user is not authenticated' do
      include_context 'without authentication'
      include_examples 'expect specific HTTP status', :unauthorized
    end
  end

  describe 'GET #show' do
    subject(:http_request) { get :show, params: { id: user_id } }

    context 'when user is authenticated' do
      include_context 'when current user authenticated is admin'
      include_examples 'expect specific HTTP status', :ok

      it 'returns the requested user' do
        expect(json_response['id']).to eq(user_id)
      end
    end

    context 'when user is not authenticated' do
      include_context 'without authentication'
      include_examples 'expect specific HTTP status', :unauthorized
    end
  end

  describe 'PUT #update' do
    subject(:http_request) { patch :update, params: { id: user_id, name: 'new name' } }

    context 'when user is authenticated' do
      include_context 'when current user authenticated is admin'
      include_examples 'expect specific HTTP status', :ok

      it 'returns the requested user' do
        expect(json_response['name']).to eq('new name')
      end
    end
  end
end
