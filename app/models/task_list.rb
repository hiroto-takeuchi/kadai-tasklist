class TaskList < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 225 }
end
