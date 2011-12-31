class Player < ActiveRecord::Base
  has_many :weights, :dependent => :destroy
  has_many :payments, :dependent => :destroy
  accepts_nested_attributes_for :weights

  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create
end
