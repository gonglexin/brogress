class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string  :title
      t.integer :total
      t.string  :subtitle
      t.string  :author
      t.string  :category
      t.string  :url
      t.string  :image
      t.text    :description

      t.timestamps
    end
  end
end
