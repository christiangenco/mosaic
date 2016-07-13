class Challenge < ApplicationRecord
  # acts_as_taggable_on :tags
  has_many :submissions
end
