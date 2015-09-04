class AddGuessesToPeople < ActiveRecord::Migration
  def change
    add_column(:people, :guess_by_weight, :string)
    add_column(:people, :guess_by_height, :string)
  end
end
