class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :practice_id, index:true
      t.uuid :system_id, index:true
      t.timestamp :created_at
      t.datetime :expires_at
      t.integer :max_tokens, default: 0
      t.integer :token_duration_seconds, default: 604800

      t.timestamps
    end
  end
end
