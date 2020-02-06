class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username
  validates_presence_of :password_digest
  has_many :malontines, foreign_key: :creator_id
  has_many :malones, through: :malontines
  has_many :love_notes, through: :malontines
end
