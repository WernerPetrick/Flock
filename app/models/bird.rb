class Bird < ApplicationRecord
  has_one_attached :image
  has_many :bird_sightings
  has_many :users_who_have_seen, through: :bird_sightings, source: :user


end
