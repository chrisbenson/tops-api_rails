class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens, id: false do |t|
      t.primary_key :id, :uuid

      #t.timestamps
    end
  end
end
