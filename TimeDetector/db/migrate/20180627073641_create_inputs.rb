class CreateInputs < ActiveRecord::Migration[5.2]
  def change
    create_table :inputs do |t|
      t.datetime :InTime
      t.datetime :OutTime

      t.timestamps
    end
  end
end
