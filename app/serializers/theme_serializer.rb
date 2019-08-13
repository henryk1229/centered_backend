class ThemeSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :users
end
