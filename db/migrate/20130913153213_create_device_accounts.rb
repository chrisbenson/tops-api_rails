class CreateDeviceAccounts < ActiveRecord::Migration
  def change
    create_table :device_accounts, id: false do |t|
      t.primary_key :id, :uuid

      t.uuid :device_id, index:true
      t.uuid :practice_id, index:true
      t.text :description
      t.boolean :active
      t.boolean :persistent_tokens

      t.timestamps
    end
  end
end
