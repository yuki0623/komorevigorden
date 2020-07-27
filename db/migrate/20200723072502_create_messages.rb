class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table   :messages do |t|
      t.text       :content,   null: false
      t.text       :image
      t.references :group,     foreign_key: true
      t.references :host,      null: false, unique: true
      t.references :casts,     null: false, unique: true
      t.references :gests,     null: false, unique: true
      t.timestamps
    end
  end
end


