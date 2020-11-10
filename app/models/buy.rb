class Buy
  include ActiveModel::Model
  attr_accessor :postalcode, :state_id, :city, :address_number, :building_name, :phone_number, :user_id, :item_id, :token

  validates :postalcode, :state_id, :city, :address_number, :phone_number, :token, presence: true
  validates :postalcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  validates :phone_number, format: { with: /\A\d{11}\z/ }

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postalcode: postalcode, state_id: state_id, city: city, address_number: address_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
