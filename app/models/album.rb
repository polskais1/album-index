class Album < ApplicationRecord
  has_many :songs
  belongs_to :artist

  scope :title_like, -> (title) { where('title like ?', "%#{title}%") }
end
