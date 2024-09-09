class AddFieldsToBirds < ActiveRecord::Migration[7.1]
  def change
    add_column :birds, :name, :string
    add_column :birds, :status, :string
    add_column :birds, :habitat, :string
    add_column :birds, :description, :text
  end
end
