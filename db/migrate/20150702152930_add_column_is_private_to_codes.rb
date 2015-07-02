class AddColumnIsPrivateToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :is_private, :boolean, default: false, null: false
  end
end
