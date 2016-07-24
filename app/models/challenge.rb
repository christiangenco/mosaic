class Challenge < ApplicationRecord
  # acts_as_taggable_on :tags
  has_many :submissions, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
