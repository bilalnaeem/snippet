class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.string :text

      t.timestamps null: false
    end
  end
end
