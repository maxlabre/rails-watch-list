class List < ApplicationRecord
  has_many :bookmarks
  validates_associated :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
