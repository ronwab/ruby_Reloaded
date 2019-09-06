class RenamePatientFirstNameField < ActiveRecord::Migration[6.0]
  def change
    rename_column :patients , :firstName, :first_name
  end
end
