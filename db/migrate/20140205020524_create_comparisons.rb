class CreateComparisons < ActiveRecord::Migration
  def change
    create_table :comparisons do |t|
      t.text :content
    end
  end
end
