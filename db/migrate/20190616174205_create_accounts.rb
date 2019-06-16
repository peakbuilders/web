class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :email, null: false, unique: true

      t.timestamps
    end
  end
end
