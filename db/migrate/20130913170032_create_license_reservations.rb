class CreateLicenseReservations < ActiveRecord::Migration
  def change
    create_table :license_reservations, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :license_id, index: true
      t.uuid :device_id, index: true
      t.uuid :person_id, index: true
      t.timestamp :created_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
