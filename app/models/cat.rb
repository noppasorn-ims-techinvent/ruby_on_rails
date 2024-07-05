class Cat < ApplicationRecord
    belongs_to :user
    
    validates :name, presence: true, length: { minimum: 3, maximum: 100 }
    validates :color, presence: true
end
  