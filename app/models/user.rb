class User < ActiveRecord::Base
  attr_accessible :name, :email, :address, :city, :phone_number
end
