class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price_excluding_tax, null: false
      t.boolean :is_sales_status, null: false, default: true
      t.integer :genre_id, null: false

      t.timestamps
    end
  end
end
