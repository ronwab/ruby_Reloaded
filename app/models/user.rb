# frozen_string_literal: true

require "bcrypt"

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true #, length: { minimum: 4 }
  validates :email, presence: true, uniqueness: true

  #created to play with custom validator.
  # validates_with UserEmailValidator

  before_save { self.email = email.downcase }
  # has_secure_password
end
