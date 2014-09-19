class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :device_model_id, index:true
      t.text :name
      t.text :description
      t.text :os_version
      t.text :unique_identifier
      t.text :serial_number
      t.text :mac_address
      t.text :local_ip_address
      t.text :public_ip_address
      t.text :local_port
      t.text :public_port
      t.text :admin_username
      t.text :admin_password_digest

      t.timestamps
    end
  end
end
