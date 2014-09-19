class CreatePracticeDevices < ActiveRecord::Migration
  def change
    create_table :practice_devices, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :practice_id, index:true
      t.uuid :device_id, index:true
      t.timestamp :created_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
