# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  management             :boolean
#  admin                  :boolean
#  noncsit                :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,  :name, :management, :admin, :noncsit
  # attr_accessible :title, :body

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { maximum: 255 }
  validates :password, presence: :true, length: { minimum: 8, maximum: 120 }, on: :create
  validates :password, on: :update, length: {minimum: 8, maximum: 120}, allow_blank: true

  has_many :after_hours_accesses
  has_many :work_orders
  has_many :jobs
  has_paper_trail
end
