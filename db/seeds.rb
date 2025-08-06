puts 'Create roles'
Rake::Task['roles:seed'].invoke

puts 'Create users'
Rake::Task['users_admin:seed'].invoke
