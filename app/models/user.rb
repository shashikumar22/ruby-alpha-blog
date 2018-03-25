class User < ApplicationRecord
	has_many :articles, dependent: :destroy
	before_save {self.email = self.email.downcase}
	validates :username, presence: true, length: {minimum: 3, maximium: 10},
             uniqueness: { case_sensitive: false}
  VALID_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence:true, length: {maximum: 105} ,
  					uniqueness: {case_sensitive: false} ,
            format: {with: VALID_EMAIL_REGEX } 
  has_secure_password                  
end 
