class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.datetime :intime
      t.datetime :outtime

      t.timestamps
    end
  end
end
