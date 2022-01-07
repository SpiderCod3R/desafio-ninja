class CreateEnterprises < ActiveRecord::Migration[6.1]
  def change
    create_table :enterprises do |t|
      t.string :name
      t.integer :rooms_number
      t.time :opening_time
      t.time :ending_time

      t.timestamps
    end
  end
end
