class Book < ActiveRecord::Base
  has_many :tag_assignments
  has_many :tags, through: :tag_assignments

  def list_display
    if self.description
      desc = self.description[0..140]
    else
      desc = "N/A"
    end
    
    <<~BOOK_DEETS
      -----------------------------------------
      Title: #{self.title}
      Authors: #{self.authors}
      Description: #{desc}
      -----------------------------------------


    BOOK_DEETS
  end

  def self.titles_by_alpha
    ordered = self.order(:title)
    ordered.map(&:title)
  end
end
