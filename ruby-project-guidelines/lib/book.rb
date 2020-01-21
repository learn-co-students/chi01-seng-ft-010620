class Book < ActiveRecord::Base
  has_many :tag_assignments
  has_many :tags, through: :tag_assignments

  def list_display
    <<~BOOK_DEETS
      -----------------------------------------
      Title: #{self.title}
      Authors: #{self.authors}
      Description: #{self.description[0..140]}
      -----------------------------------------


    BOOK_DEETS
  end

  def self.titles_by_alpha
    ordered = self.order(:title)
    ordered.map(&:title)
  end
end
