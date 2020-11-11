class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postalcode,     null: false
      t.integer    :state_id,       null: false
      t.string     :city,           null: false
      t.string     :address_number, null: false
      t.string     :building_name
      t.string     :phone_number,   null: false
      t.references :purchase,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
