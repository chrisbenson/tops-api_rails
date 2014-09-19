class CreateEmployeePermissions < ActiveRecord::Migration
  def change
    create_table :employee_permissions, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :employee_id, index: true
      t.uuid :permission_id, index: true
      t.timestamp :created_at
      t.datetime :expires_at

      t.timestamps
    end
  end
end
