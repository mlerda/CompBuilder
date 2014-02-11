class CreateFavoriteComparisons < ActiveRecord::Migration
  def change
    create_table :favorite_comparisons do |t|
      t.belongs_to :user
      t.integer :comparison_id
      t.integer :user_id

      t.timestamps
    end
  end
end
