class AddSizeToBirds < ActiveRecord::Migration[7.1]
  def change
    add_column :birds, :size, :integer
  end
end
