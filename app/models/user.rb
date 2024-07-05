class User < ApplicationRecord
    has_many :cats, dependent: :destroy
end
  