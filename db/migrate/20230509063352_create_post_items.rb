class CreatePostItems < ActiveRecord::Migration[6.1]
  def change
    create_table :post_items do |t|
      t.string :introduction
      t.timestamps
    end
  end
end
