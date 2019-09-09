# frozen_string_literal: true

class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :age, presence: true, numericality: true
end
