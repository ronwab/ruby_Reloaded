# frozen_string_literal: true

class AddPasswordColumnToUserModel < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :saved_password, :string
  end
end
