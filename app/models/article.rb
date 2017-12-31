class Article < ActiveRecord::Base
  # Ensures that all articles have none-empty titles
  validates :title, presence: true, length: {minimum: 3, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  #validates :title, presence: true
  #validates :description, presence: true
  
end