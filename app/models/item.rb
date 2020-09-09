class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_when
  belongs_to_active_hash :delivery_where

  validates :name, :content, :price, :category, :status, :delivery_fee, :delivery_when, :delivery_where, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :delivery_when_id, :delivery_where_id, numericality: { other_than: 1 }
end
