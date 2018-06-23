class Event < ApplicationRecord
  validates :title, :date, :place, :content, presence: true

  belongs_to :user
  has_many :participant_managements, dependent: :destroy
  has_many :participant_management_users, through: :participant_managements, source: :user
end
