class CreateClassifications < ActiveRecord::Migration
  def change
    create_table :classifications do |t|
      t.integer :post_id
      t.integer :category_id
    end
  end
end
