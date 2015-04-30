class AddScoreToItems < ActiveRecord::Migration
  def change
    add_column :items, :score, :integer, default: 1
    add_index :items, :score
  end
end
