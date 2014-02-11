class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|
      t.belongs_to :company
      t.belongs_to :user
      t.text :content
    end
  end
end
