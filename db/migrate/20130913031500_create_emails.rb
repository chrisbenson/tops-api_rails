class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails, id: false do |t|
      t.primary_key :id, :uuid
      t.text :address

      t.timestamps
    end
  end
end
