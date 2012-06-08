class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :name_kana
      t.string :name_halfkana
      t.string :name_hiragana

      t.timestamps
    end
  end
end
