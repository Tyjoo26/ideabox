class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string      :username
      t.string      :password_digest
      t.integer     :role
    end
  end
end
