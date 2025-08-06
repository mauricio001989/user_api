
class UserSerializer < ActiveModel::Serializer
  attribute :id
  attribute :email
  attribute :name
  attribute :nickname
  attribute :image

  has_many :roles
end
