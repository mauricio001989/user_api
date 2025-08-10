module RoleCheckable
  extend ActiveSupport::Concern

  ROLES = YAML.load_file(Rails.root.join('lib/data/roles.yml'))['roles']

  included do
    ROLES.each do |name|
      define_method("#{name}?") do
        roles.exists?(name:)
      end
    end
  end
end
