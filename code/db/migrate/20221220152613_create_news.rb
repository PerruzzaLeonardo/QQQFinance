class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :titolo
      t.string :descrizione
      t.string :autore
      t.string :url
      t.string :urlimg

      t.timestamps
    end
  end
end
