class ChangeSpecialityName < ActiveRecord::Migration
  def up
    change_table :specialities do |t|
      t.rename :name, :sname
    end
  end

  def down
    change_table :specialities do |t|
      t.rename :sname, :name
    end
  end
end
