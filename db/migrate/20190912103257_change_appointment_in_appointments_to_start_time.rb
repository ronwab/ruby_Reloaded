class ChangeAppointmentInAppointmentsToStartTime < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :appointment, :starting_at
  end
end
