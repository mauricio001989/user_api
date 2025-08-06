module RoleCheckable
  extend ActiveSupport::Concern

  included do
    Role.pluck(:name).each do |name|
      define_method("#{name}?") do
        roles.exists?(name:)
      end
    end
  end
end
