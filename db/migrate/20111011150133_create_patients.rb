class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :address
      t.datetime :birthdate
      t.string :sex
      t.string :username
      t.string :password_md5

      t.timestamps
    end
  end
end
