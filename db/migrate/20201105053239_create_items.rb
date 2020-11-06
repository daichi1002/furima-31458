class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,            null: false
      t.text       :description,     null: false
      t.integer    :category_id,     null: false
      t.integer    :status_id,       null: false
      t.integer    :ship_method_id,  null: false
      t.integer    :consignor_id,    null: false
      t.integer    :days_to_ship_id, null: false
      t.integer    :amount_sold,     null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
