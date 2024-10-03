class User < ApplicationRecord

  before_create :assign_avatar
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bird_sightings
  has_many :seen_birds, through: :bird_sightings, source: :bird

 
  private

  def assign_avatar
    avatar = BoringAvatar::Beam.new(name: email, size: 140).generate
    self.avatar_url = avatar.to_s
  end
end
