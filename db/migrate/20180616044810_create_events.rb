class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :place
      t.text :content
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
