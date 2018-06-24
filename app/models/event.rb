class Event < ApplicationRecord
  validates :title, :date, :place, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 255 }

  belongs_to :user
  has_many :participant_managements, dependent: :destroy
  has_many :participant_management_users, through: :participant_managements, source: :user
end
