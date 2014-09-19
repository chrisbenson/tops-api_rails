class CreateUserAccounts < ActiveRecord::Migration
  def change
    create_table :user_accounts, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :person_id, index:true
      t.text :password_encrypted
      t.text :locale
      t.boolean :active
      t.boolean :persistent_tokens

      t.timestamps
    end
  end
end
