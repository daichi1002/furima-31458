class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :ship_method
  belongs_to :consignor
  belongs_to :days_to_ship
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :image, :name, :description, :category_id, :status_id, :ship_method_id, :consignor_id, :days_to_ship_id, presence: true
  validates :amount_sold, presence: true, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
