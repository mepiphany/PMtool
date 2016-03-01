class Discussion < ActiveRecord::Base
  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :title, presence: true

  validates :body, length: { minimum: 5,
                             maximum: 300 }

end
