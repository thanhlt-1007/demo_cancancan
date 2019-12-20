class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable

  has_many :posts, dependent: :destroy

  validates :password_confirmation, presence: true, if: :password
end
