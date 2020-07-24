class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table   :messages do |t|
      # t.string     :content
      # t.string     :image
      # t.references :group,     foreign_key: true
      # t.references :user,      foreign_key: true
      # t.references :host_id,   null: false, unique: true
      # t.references :casts_id,  null: false, unique: true
      # t.references :gests_id,  null: false, unique: true
      # t.text       :sentences, null: false
      # # t.datetime   :senddate, :sendtime, null: false
      # t.string     :image
      # # t.string     :id,         null: false, unique: true
      t.timestamps
    end
  end
end


