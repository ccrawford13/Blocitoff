class ChangeUserScoreToFloat < ActiveRecord::Migration
  def up
    change_column :items, :score, :float
  end

  def down
    change_column :items, :score, :integer
  end
end
