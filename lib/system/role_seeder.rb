require 'yaml'

module System
  class RoleSeeder
    def self.roles
      YAML.load_file(Rails.root.join('lib/data/roles.yml'))['roles']
    end

    def self.seed
      roles.each do |name|
        Role.find_or_create_by!(name:)
      end
    end
  end
end
