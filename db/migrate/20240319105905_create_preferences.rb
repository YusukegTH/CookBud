class CreatePreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.text :appliances, array: true, default: []
      t.text :inventory, array: true, default: []
      t.text :diet, array: true, default: []
      t.text :allergies, array: true, default: []
      t.string :level

      t.timestamps
    end
  end
end
