class AddFieldToKinds < ActiveRecord::Migration[5.2]
  def change
    add_column :kinds, :user_id, :integer
  end
end
