class AddColumnTokenToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :token, :string, null: true
  end
end
