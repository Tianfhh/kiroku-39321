class Entry < ApplicationRecord
  
  validates :title, presence: true
  validates :text, presence: true

  has_one_attached :photo
  validates :photo, presence: true

end
