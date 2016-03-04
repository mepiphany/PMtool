class Task < ActiveRecord::Base
  belongs_to :project

  belongs_to :user

  validates :title, presence: true

  validates :due_date, presence: true



end
