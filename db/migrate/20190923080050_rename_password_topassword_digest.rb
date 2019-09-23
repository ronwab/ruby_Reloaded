# frozen_string_literal: true

class RenamePasswordTopasswordDigest < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :saved_password, :password_digest
  end
end
