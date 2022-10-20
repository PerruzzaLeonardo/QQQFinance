class CreateAziones < ActiveRecord::Migration[7.0]
  def change
    create_table :aziones do |t|
      t.string :nome
      t.string :isin
      t.string :settore
      t.string :paese
      t.float :marketcap
      t.float :prezzo
      t.float :volume
      t.float :pe
      t.float :ps
      t.float :pb
      t.float :divyield
      t.float :roe
      t.float :roa
      t.float :debteq
      t.float :opmargin
      t.float :ebitda

      t.timestamps
    end
  end
end
