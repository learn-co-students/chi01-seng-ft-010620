class Cow < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :spots, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validate :cannot_share_existing_farmer_name, details: "YOU DUN GOOFED"
  belongs_to :farmer

  def cannot_share_existing_farmer_name
    farmer_names = Farmer.all.map { |f| f.name.downcase }
    cow_name = name.downcase
    errors.add(:name, "already exists on a Farmer here") if farmer_names.include?(cow_name)
  end
end
