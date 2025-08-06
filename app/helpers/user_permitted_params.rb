class UserPermittedParams < BasePermittedParams
  PERMITTED_PARAMS = %i[email name nickname image password password_confirmation].freeze
end
