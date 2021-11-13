class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :mobile

      t.timestamps
    end
  end
end
