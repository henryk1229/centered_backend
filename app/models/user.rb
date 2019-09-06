class User < ApplicationRecord
  before_create :set_koan
  has_secure_password

  # validations
  # before_save { self.email = email.downcase }
  validates :username,  presence: true, length: { maximum: 50 },
                  uniqueness: true
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :email, presence: true, length: { maximum: 255 },
  #                 format: { with: VALID_EMAIL_REGEX },
  #                 uniqueness: {case_sensitive: false}
  # validates :password, presence: true, length: { minimum: 6 }

  #relations
  has_many :userthemes
  has_many :themes, through: :userthemes

  def set_koan
    koan = Digest::MD5::hexdigest(rand(1..100).to_s)
    split = koan.split(//)
    num_array = []
    split.each { |x| ("1".."9").include?(x) ? num_array << x : false }
    num_str = num_array.join
    num_str.length > 12 ? num = num_str[0..11] : num = num_str
    num_int = num.to_i
    self.koan_number = num_int
  end


end
