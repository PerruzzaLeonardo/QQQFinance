class DropTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :notizies
    drop_table :profilos
    drop_table :news
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
