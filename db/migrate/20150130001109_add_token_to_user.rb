class AddTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :rdio_access_token, :string
  end
end
