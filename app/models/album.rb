class Album < ApplicationRecord
  belongs_to :artist

  scope :title_like, -> (title) { where('title like ?', "%#{title}%") }
end
