class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.string :name
      t.integer :age 
      t.text :hobby
      t.text :about
      t.date :birthday
      t.string :image
      t.integer :user_id
      t.timestamps
    end
  end
end
