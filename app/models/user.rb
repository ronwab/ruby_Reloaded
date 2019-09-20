class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :email, presence: true, uniqueness: true, confirmation: { case_sensitive: false }
end
