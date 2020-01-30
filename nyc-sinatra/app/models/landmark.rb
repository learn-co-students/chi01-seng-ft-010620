class Landmark < ActiveRecord::Base
  # belongs_to :approver, class_name: Figure, foreign_key: :figure_id
  belongs_to :figure
end
