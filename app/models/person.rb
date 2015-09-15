class Person < ActiveRecord::Base
  validates :height, :weight, :gender, presence: true
  validates :height, :weight, numericality: true
  validates :gender, in: ["M", "F"]
end
