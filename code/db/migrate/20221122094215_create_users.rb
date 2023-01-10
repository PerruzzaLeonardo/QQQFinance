class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :nome
      t.string :cognome
      t.string :email
      t.string :username
      t.string :pubblico
      t.string :commento

      t.timestamps
    end
  end
end
