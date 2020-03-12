class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :number, null: false
      t.string :name, null: false
      t.integer :settlement, null: false
      t.timestamps
    end
  end
end
