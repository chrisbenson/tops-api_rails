class CreateDeviceAuthTokens < ActiveRecord::Migration
  def change
    create_table :device_auth_tokens, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :device_account_id, index:true
      t.uuid :auth_token_id, index:true
      t.timestamp :created_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
