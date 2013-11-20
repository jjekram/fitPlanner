# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  city            :string(255)
#  country         :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
	has_many :routines 
    attr_accessible :city, :country, :email, :name, :password, :password_confirmation

    before_save { self.email = email.downcase }

    validates :name, presence: true, length: { maximum: 70}
    EMAIL_VALIDATION_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  	validates :email, presence: true, uniqueness: true, format: { with: EMAIL_VALIDATION_REGEX }, uniqueness: {case_sensitive: false}

  	has_secure_password
  	validates :password, presence: true, length: { minimum: 6 }
  	validates :password_confirmation, presence: true

  	
    
end
