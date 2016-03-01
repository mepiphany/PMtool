class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  validates :user_id, :project_id, presence: true

  validates :user_id, uniqueness: { scope: :project_id }

  validate :not_self_favorite

  def not_self_favorite
    if project.created_by?(user)
      errors.add(:created_by, "Cant fav your own")
    end
  end
end
