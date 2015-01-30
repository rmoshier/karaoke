class AddSecretToUser < ActiveRecord::Migration
  def change
    add_column :users, :rdio_access_secret, :string
  end
end
