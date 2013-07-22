class User < ActiveRecord::Base
  has_secure_password
  attr_accessor :current_password

  has_many :items, dependent: :destroy

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 2, maximum: 20 }

  validates :email, presence: true,
                    uniqueness: true,
                    format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
end
