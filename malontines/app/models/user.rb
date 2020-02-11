class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password_digest

  has_many :malontines, foreign_key: :creator_id
  has_many :malones, through: :malontines
  has_many :love_notes, through: :malontines

  def same_as(other)
    self.id == other.id
  end
  # def password
  #   @password ||= BCrypt::Password.new(self.password_digest)
  # end
  #
  # def password=(new_pass)
  #   self.password_digest = BCrypt::Password.create(new_pass).to_s
  # end
  #
  # def authenticate(attempt)
  #   self.password == attempted
  # end
end
