class Room < ApplicationRecord
  belongs_to :enterprise

  validates :name, presence: true

  validate :limitReached?, on: :create

  private
    def limitReached?
      limit_reached = Room.where(enterprise_id: enterprise_id).count
      if limit_reached >= self.enterprise.rooms_number
        errors.add(:name, "Limite maximo de salas alcançado para esta empresa")
      else
        return true
      end
    end
end
