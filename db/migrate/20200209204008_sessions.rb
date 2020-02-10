class Sessions < ActiveRecord::Migration[6.0]
  def change
    create_table :sessions do |t|
      t.date :date
      t.float :hours
      t.string :description
      t.integer :user_id
      t.integer :client_id
      
    end
  end
end
