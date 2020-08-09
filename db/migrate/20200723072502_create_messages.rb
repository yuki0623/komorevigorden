class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table   :messages do |t|
      t.text       :content,   null: false
      t.text       :image
      t.references :karte
      t.references :host
      t.references :cast
      t.references :gest
      t.timestamps
    end
  end
end


