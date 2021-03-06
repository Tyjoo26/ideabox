class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin"]

  has_many :ideas
end
