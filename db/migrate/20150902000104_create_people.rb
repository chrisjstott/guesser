class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string  :gender, null: false
      t.integer :height, null: false
      t.integer :weight, null: false
      
      t.timestamps null: false
    end
  end
end