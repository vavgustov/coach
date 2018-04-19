class CreateFailures < ActiveRecord::Migration[5.2]
  def change
    create_table :failures do |t|
      t.references :word, foreign_key: true
      t.date :date
    end
  end
end
