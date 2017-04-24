class Artist < ApplicationRecord
  has_many :albums

  scope :name_like, -> (name) { where('name like ?', "%#{name}%") }
end
