class User < ApplicationRecord
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User
  include RoleCheckable

  after_commit :assign_default_role, on: :create

  devise :database_authenticatable, :registerable, :confirmable, :recoverable, :rememberable, :validatable
  validates :email, presence: true, uniqueness: { case_sensitive: false, scope: :provider }, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :user_roles, dependent: :delete_all
  has_many :roles, through: :user_roles

  private

  def assign_default_role
    return unless roles.empty?

    roles << Role.find_by(name: 'customer')
  end
end
