class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'#, foreign_key: 'user_id'
  has_and_belongs_to_many :attendees, class_name: 'User'
  
  validates :date, presence: true
  validates :place, presence:true
  validates :description, presence:true

  scope :current, -> {where("date > ?", DateTime.now)}
  scope :past, -> {where("date < ?", DateTime.now)}
end
