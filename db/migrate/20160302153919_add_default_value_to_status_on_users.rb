class AddDefaultValueToStatusOnUsers < ActiveRecord::Migration
  def change
  	change_column_default :users, :status, 0
  end
end
