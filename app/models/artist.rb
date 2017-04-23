class Artist < ApplicationRecord
  scope :name_like, -> (name) { where('name like ?', "%#{name}%") }
end
