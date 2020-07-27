class CreateKartes < ActiveRecord::Migration[5.2]
  def change
    create_table :kartes do |t|
      t.string   :nickname,              null: false
      t.string   :age,                   null: false
      t.string   :from,                  null: false
      t.decimal  :birthday,              null: false
      t.string   :gender_identities
      t.text     :consultation_content,  null: false
      t.text     :hearing1,              null: false
      t.text     :hearing2,              null: false
      t.text     :hearing3
      t.text     :hearing4
      t.text     :remarks

      t.references :host
      t.references :casts
      t.references :gests

      t.timestamps
    end
  end
end
