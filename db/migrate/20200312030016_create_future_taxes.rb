class CreateFutureTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :future_taxes do |t|
      t.integer :sales, null: false
      t.integer :profit_rate, null: false
      t.integer :fix_cost, null: false
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
