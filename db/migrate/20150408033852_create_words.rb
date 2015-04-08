class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :content
      t.string :speak_url
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
