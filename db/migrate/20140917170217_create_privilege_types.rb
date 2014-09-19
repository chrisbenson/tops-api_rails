class CreatePrivilegeTypes < ActiveRecord::Migration
  def change
    create_table :privilege_types do |t|
      t.string :type_label
      t.integer :type_id

      t.timestamps
    end
  end
end
