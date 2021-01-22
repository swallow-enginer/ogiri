class CreateJokes < ActiveRecord::Migration[6.1]
  def change
    create_table :jokes do |t|
      t.integer :joke_id
      t.string :joke

      t.timestamps
    end
  end
end
