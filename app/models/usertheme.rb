class Usertheme < ApplicationRecord
  belongs_to :user
  belongs_to :theme
end
