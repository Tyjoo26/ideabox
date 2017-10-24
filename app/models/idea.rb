class Idea < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  validates_presence_of :content

  belongs_to :category
end
