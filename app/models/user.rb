class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :doorkeeper, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reccs
  has_many :suggestions, class_name: :Recc
  has_many :ratings
  has_many :comments
end
