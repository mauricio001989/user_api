module Users
  class UpdateService
    def initialize(id:, params:, current_user:)
      @user = user(id:, current_user:)
      @params = params
    end

    def execute!
      @user.update(@params)

      @user
    end

    def user(id:, current_user:)
      current_user.admin? ? User.find(id) : current_user
    end
  end
end
