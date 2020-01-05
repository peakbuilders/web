class CreateBusinesses < ActiveRecord::Migration[6.0]
  def change
    create_table :businesses do |t|
      t.belongs_to :account

      t.string :name, null: false
      t.text :memo, null: false
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
