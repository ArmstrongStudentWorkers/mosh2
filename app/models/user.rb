class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,  :name, :management, :admin, :non_csit
  # attr_accessible :title, :body

  validates :password, presence: :true, length: { minimum: 8, maximum: 120 }, on: :create
  validates :password, on: :update, length: {minimum: 8, maximum: 120}, allow_blank: true
end
