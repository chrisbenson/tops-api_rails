class CreateEmailCategories < ActiveRecord::Migration
  def change
    create_table :email_categories, id: false do |t|
      t.primary_key :id, :uuid
      t.text :name

      t.timestamps
    end
  end
end
