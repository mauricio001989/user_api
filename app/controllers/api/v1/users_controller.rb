module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate_user!

      def index
        @users = User.all
        render json: @users
      end

      def show
        render json: user
      end

      def update
        service = Users::UpdateService.new(id: params[:id], params: user_params, current_user:)

        user = service.execute!

        render json: user
      end

      private

      def user
        current_user.admin? ? User.find(params[:id]) : current_user
      end

      def user_params
        UserPermittedParams.permitted_params_for(params:)
      end
    end
  end
end
