class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices, id: false do |t|
      t.primary_key :id, :uuid
      t.text :name
      t.text :code

      t.timestamps
    end
  end
end
