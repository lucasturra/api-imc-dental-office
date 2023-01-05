class CreateImcs < ActiveRecord::Migration[7.0]
  def change
    create_table :imcs do |t|
      t.decimal :height
      t.decimal :weight

      t.timestamps
    end
  end
end
