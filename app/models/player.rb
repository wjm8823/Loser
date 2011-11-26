class Player < ActiveRecord::Base
	has_many :weights, :dependent => :destroy
	has_many :payments, :dependent => :destroy
	accepts_nested_attributes_for :weights
end
