class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :user
      t.integer :isin
      t.string :commento

      t.timestamps
    end
  end
end
