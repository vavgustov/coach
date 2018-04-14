class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :en
      t.string :ru
      t.integer :popularity
      t.integer :success, default: 0
      t.integer :failures, default: 0
    end
  end
end
