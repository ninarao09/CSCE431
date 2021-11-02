class CreateEvents < ActiveRecord::Migration[6.1]
    def change
      create_table :events do |t|
        t.string :name
        t.string :info
        t.date :date
        t.time :time
        t.string :event_type
        t.string :address
        t.string :season
        t.integer :score
  
        t.timestamps
      end
    end
  end