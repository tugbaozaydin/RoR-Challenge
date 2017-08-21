class Article < ApplicationRecord
	 has_many :comments, dependent: :destroy
     validates :title, presence: true, length: { minimum: 5 }
     many_to_many :categories
end
