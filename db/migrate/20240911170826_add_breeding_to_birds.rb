class AddBreedingToBirds < ActiveRecord::Migration[7.1]
  def change
    add_column :birds, :breeding_season, :string
  end
end
