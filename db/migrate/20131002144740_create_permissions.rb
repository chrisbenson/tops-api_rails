class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions, id: false do |t|
      t.primary_key :id, :uuid
      t.uuid :system_id, index: true
      t.text :name
      t.text :code
      t.text :description

      t.timestamps
    end
  end
end
