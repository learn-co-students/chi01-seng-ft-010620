class Malone < ActiveRecord::Base
  validates_presence_of :title, :image_url, :description
  validates_uniqueness_of :title, :image_url
end
