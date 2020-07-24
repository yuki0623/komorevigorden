class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table   :groups_users do |t|
    #   # t.references :group,                 foreign_key: true
    #   t.integer    :host_id,  null: false, foreign_key: true
    #   t.integer    :casts_id, null: false, foreign_key: true
    #   t.integer    :gests_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end

