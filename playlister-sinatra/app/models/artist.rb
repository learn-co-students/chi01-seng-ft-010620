require_relative "concerns/slugifiable"
class Artist < ActiveRecord::Base
  include Slugifiable
end
