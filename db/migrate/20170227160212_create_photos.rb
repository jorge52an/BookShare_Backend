class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
