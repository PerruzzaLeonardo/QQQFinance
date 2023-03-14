class AddAvatarProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :azione_id, :integer
    add_column :users, :immagine, :string
    remove_column :comments, :isin, :integer
  end
end
