class Item < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_one :order, dependent: :destroy
  has_one :card
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_when
  belongs_to_active_hash :delivery_where

  validates :name, :images, :content, :price, :category, :status, :delivery_fee, :delivery_when, :delivery_where, presence: true
  validates :category_id, :status_id, :delivery_fee_id, :delivery_when_id, :delivery_where_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  def favorite_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search != ""
      Item.where(['name LIKE(?) OR content LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Item.all
    end
  end

end
