class Player < ActiveRecord::Base
	has_many :weights
	has_many :payments
end
