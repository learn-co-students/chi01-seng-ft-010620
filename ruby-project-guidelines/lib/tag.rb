class Tag < ActiveRecord::Base
  has_many :tag_assignments
  has_many :books, through: :tag_assignments

  validates :name, uniqueness: true
end
