class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.timestamps
      t.belongs_to :gossip, index: true
      t.belongs_to :user, index: true


    end
  end
end
