class Article < ApplicationRecord 
	belongs_to :user
	has_many :comments
	
	validates :title, presence: true, length: {minimum: 3, maximum: 20} 
	validates :description, presence: true, length: {minimum: 10, maximun:300}
end
