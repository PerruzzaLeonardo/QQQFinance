class AddUserIdToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :integer
    remove_column :comments, :user, :string
  end
end
