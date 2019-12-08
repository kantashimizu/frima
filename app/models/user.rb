class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         mount_uploader :image, ImageUploader

  validates :nickname, presence: true,unique: true
  validates :email, presence: true,unique: true
  validates :tel, presence: true,unique: true
  validates :family_name_knj, presence: true
  validates :family_name_ktkne, presence: true
  validates :first_name_knj, presence: true
  validates :first_name_ktkne, presence: true
  validates :birth, presence: true

end
