class Person < ActiveRecord::Base
  validates :height, :weight, :gender, presence: true
  validates :height, :weight, numericality: true
  validates :gender, inclusion: {in: ["M", "F"]}
end
