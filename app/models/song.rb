class Song < ApplicationRecord
  belongs_to :album

  scope :title_like, -> (title) { where('title like ?', "%#{title}%") }
end
