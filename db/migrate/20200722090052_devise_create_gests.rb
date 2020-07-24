# frozen_string_literal: true

class DeviseCreateGests < ActiveRecord::Migration[5.2]
  def change
    create_table :gests do |t|
      ## Database authenticatable
      t.string   :email,              null: false, default: ""
      t.string   :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.integer  :password, foreign_key: true

      ## Rememberable
      t.datetime :remember_created_at
      t.string   :name,     null: false
      t.string   :age,      null: false
      t.string   :from,     null: false
      t.decimal  :birthday, null: false
      t.string   :nickname, null: false
      t.text     :remarks
      t.string   :id,       null: false, unique: true

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :gests, :email,                unique: true
    add_index :gests, :reset_password_token, unique: true
    # add_index :gests, :confirmation_token,   unique: true
    # add_index :gests, :unlock_token,         unique: true
  end
end
