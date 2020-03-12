class Company < ApplicationRecord
  has_many :future_taxes, dependent: :delete_all
  has_many :schedules, dependent: :delete_all
  validates :name,:number,:settlement, presence: true
end
