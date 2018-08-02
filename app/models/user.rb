class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :doorkeeper, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reccs
  has_many :ratings
  has_many :comments
  has_many :proposals, :through => :suggestions
end
