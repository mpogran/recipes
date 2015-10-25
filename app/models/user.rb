class User < ActiveRecord::Base
  has_secure_password

  # Associations
  has_many :containers
  has_many :owned_recipes, class_name: 'Recipe', foreign_key: 'owner_id'

  # Validations
  validates :email, email: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true
end
