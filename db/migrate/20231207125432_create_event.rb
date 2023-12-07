class CreateEvent < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :activity
      t.integer :year
      t.string :gender
      t.integer :sharman
      t.integer :winston
      t.integer :ennis
      t.integer :turing

      t.timestamps
    end
  end
end
