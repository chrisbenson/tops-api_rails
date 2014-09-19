class CreatePeople < ActiveRecord::Migration

  def change

    create_table :people, id: false do |t|
      t.primary_key :id, :uuid
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.date :birth_date
      t.date :death_date

      t.timestamps
    end
  end

end
