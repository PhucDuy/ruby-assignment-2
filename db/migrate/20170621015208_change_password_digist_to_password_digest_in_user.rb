class ChangePasswordDigistToPasswordDigestInUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :password_digist, :password_digest
  end
end
