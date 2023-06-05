class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :point
      t.integer :post_item_id
      t.integer :user_id
      t.timestamps
    end
  end
end
