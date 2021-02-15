class AddStatusToMicropost < ActiveRecord::Migration[6.0]
  def change
    add_column :microposts, :status,  :integer, default: 0, null:false
  end
end
