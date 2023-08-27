class Entry < ApplicationRecord
  validates :title, presence: true
  validates :photo, presence: true
  validates :text, presence: true

  has_one_attached :photo

end
