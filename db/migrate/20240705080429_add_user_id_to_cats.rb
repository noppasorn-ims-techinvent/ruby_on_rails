class AddUserIdToCats < ActiveRecord::Migration[7.2]
  def change
    add_column :cats, :user_id, :int
  end
end
