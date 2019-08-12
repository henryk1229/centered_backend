class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :koan_number
  has_many :themes
end
