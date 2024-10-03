class CreateBirdSightings < ActiveRecord::Migration[7.1]
  def change
    create_table :bird_sightings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bird, null: false, foreign_key: true

      t.timestamps
    end
  end
end
