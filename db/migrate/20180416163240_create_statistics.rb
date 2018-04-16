class CreateStatistics < ActiveRecord::Migration[5.2]
  def change
    create_table :statistics do |t|
      t.string :result
      t.integer :amount, default: 0
      t.date :date
    end

    add_index :statistics, [:result, :date], unique: true
  end
end
