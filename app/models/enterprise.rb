class Enterprise < ApplicationRecord
  validates :name, :rooms_number, :opening_time, :ending_time, presence: true
  validates :name, uniqueness: true
end
