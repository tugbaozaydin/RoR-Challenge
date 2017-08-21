class Profile < ApplicationRecord
  belongs_to :user
   validates :name,  presence: true
  validates :surname,   presence: true
end
