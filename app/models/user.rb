class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders
  has_one  :card, dependent: :destroy
  has_many :comments
  has_many :favorites

  validates :nickname, presence: true
  validates :email, uniqueness: true, format: { with: /.+@.+/ }
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]{6,}+\z/i }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birth_date, presence: true
end
