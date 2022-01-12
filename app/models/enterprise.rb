class Enterprise < ApplicationRecord
  validates :name, :rooms_number, :opening_time, :ending_time, presence: true
  validates :name, uniqueness: true

  has_many :rooms
  accepts_nested_attributes_for :rooms, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
