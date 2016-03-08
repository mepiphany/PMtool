class Project < ActiveRecord::Base
  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :destroy
  belongs_to :user

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  mount_uploader :image, ImageUploader
  mount_uploader :file, FileUploader

  validates :title, presence: true,
                    uniqueness: true

  validates :description, length: { minimum: 3 ,
                                    maximum: 255
                                       }
  validates :due_date, presence: true



  def favor_for(user)
    favorites.find_by_user_id user
  end

  def created_by?(current_user)
    user.id == current_user.id
  end


end
