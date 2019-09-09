# frozen_string_literal: true

class AddLastNameToPatient < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :phone_number, :integer
  end
end
