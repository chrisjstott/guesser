class Person < ActiveRecord::Base
  validates :height, :weight, :gender, presence: true
end
