class CreateFrames < ActiveRecord::Migration
  def change
    create_table :frames do |t|
      t.string :artist
      t.string :email
      t.string :title
      t.string :category
      t.string :tags
      t.string :aws_url
      t.integer :sold_times
      t.decimal :income

      t.timestamps null: false
    end
  end
end
