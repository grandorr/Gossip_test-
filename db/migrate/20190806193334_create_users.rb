class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.text :email
      t.integer :age
      t.timestamps
      t.timestamps
      t.belongs_to :city, index:true
    end
  end
end
