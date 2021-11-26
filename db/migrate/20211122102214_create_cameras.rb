class CreateCameras < ActiveRecord::Migration[6.1]
  def change
    create_table :cameras do |t|
      t.string :image
      t.integer :user_id
      t.string :title

      t.timestamps
    end
  end
end
