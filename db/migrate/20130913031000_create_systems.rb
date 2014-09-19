class CreateSystems < ActiveRecord::Migration
  def change
    create_table :systems, id: false do |t|
      t.primary_key :id, :uuid
      t.text :name
      t.text :code
      t.boolean :product?

      t.timestamps
    end
  end
end
