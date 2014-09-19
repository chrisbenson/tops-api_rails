class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :person_id, index: true
      t.uuid :practice_id, index: true
      t.boolean :active
      t.timestamp :created_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
