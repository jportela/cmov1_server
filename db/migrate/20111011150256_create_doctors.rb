class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.datetime :birthdate
      t.string :photo
      t.string :username
      t.string :password_md5
      t.integer :speciality_id

      t.timestamps
    end
  end
end
