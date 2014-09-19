class CreateDeviceModels < ActiveRecord::Migration
  def change
    create_table :device_models, id: false do |t|
      t.primary_key :id, :uuid
      t.text :name

      t.timestamps
    end
  end
end
