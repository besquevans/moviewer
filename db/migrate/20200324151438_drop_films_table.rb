class DropFilmsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :films do |t|
      t.string :title
      t.integer :year
      t.text :intro
    end
  end
end
