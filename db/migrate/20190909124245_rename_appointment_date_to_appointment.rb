class RenameAppointmentDateToAppointment < ActiveRecord::Migration[6.0]
  def change
    rename_column :appointments, :appointment_date, :appointment
  end
end
