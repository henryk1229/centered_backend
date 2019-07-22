class Theme < ApplicationRecord
  has_many :userthemes
  has_many :users, through: :userthemes 
end
