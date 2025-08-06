namespace :roles do
  desc 'Create base roles from YML'

  task seed: :environment do
    System::RoleSeeder.seed
    puts "Roles seeded: #{System::RoleSeeder.roles.join(', ')}"
  end
end
