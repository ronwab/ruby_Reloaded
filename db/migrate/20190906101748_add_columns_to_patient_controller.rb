class AddColumnsToPatientController < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :last_name, :string
    add_column :patients, :date_of_birth, :datetime
    add_column :doctors, :specialty, :string
  end
end
