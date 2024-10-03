class BirdSighting < ApplicationRecord
  belongs_to :user
  belongs_to :bird
end
