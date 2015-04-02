class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  	validates :first_name, :last_name, presence: true
  	validates :email, format: { with: EMAIL_REGEX }, presence: true
  	validates :password, length: { in: (4..20)}

	before_save do
	  	self.email.downcase!
	end

end
