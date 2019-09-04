class RenamePhysicianIdToDoctorId < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :physician_id, :doctor_id
  end
end
