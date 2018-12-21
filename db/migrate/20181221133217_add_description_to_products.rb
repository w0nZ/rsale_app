class AddDescriptionToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :description, :text
    add_column :products, :created_at, :datetime
    add_column :products, :updated_at, :datetime
  end
end
