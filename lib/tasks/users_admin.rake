namespace :users_admin do
  desc 'Create users admin'

  task seed: :environment do
    email = ENV.fetch('USER_ADMIN_EMAIL')
    password = ENV.fetch('USER_ADMIN_PASSWORD')

    admin = User.find_or_initialize_by(email:)

    admin.assign_attributes(
      password:,
      password_confirmation: password,
      confirmed_at: Time.current
    )

    admin.save!

    admin_role = Role.find_by!(name: 'admin')
    admin.roles << admin_role unless admin.roles.include?(admin_role)

    puts "User #{ admin.email } created with role #{ admin_role.name }"
  end
end
