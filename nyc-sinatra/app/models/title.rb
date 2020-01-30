class Title < ActiveRecord::Base
  # has_many :f_ts, class_name: :FigureTitle
  # has_many :figures, through: :f_ts
  has_many :figure_titles
  has_many :figures, through: :figure_titles
  has_many :associated_landmarks, through: :figures, source: :landmarks
end
