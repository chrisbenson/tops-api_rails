class CreatePersonEmails < ActiveRecord::Migration
  def change
    create_table :person_emails, id: false do |t|
      #t.primary_key :id, :uuid
      t.uuid :id, primary_key: true
      t.uuid :person_id, index: true
      t.uuid :email_id, index:true
      t.uuid :email_category_id, index:true
      t.timestamp :created_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
