class Category < ApplicationRecord
  validates_presence_of :title, uniqueness: true

  has_many :ideas
end
