class Review < ApplicationRecord
  belongs_to :restaurant

    # validates :review, presence: true
end
