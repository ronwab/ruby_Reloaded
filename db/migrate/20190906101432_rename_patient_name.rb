# frozen_string_literal: true

class RenamePatientName < ActiveRecord::Migration[6.0]
  def change
    rename_column :patients, :name, :firstName
  end
end
