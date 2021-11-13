# frozen_string_literal: true

class AddDeviseToMembers < ActiveRecord::Migration[6.1]
  def change
    change_table :members do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :members, :email, unique: true
    add_index :members, :reset_password_token, unique: true
  end
end
