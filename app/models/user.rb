class User < ActiveRecord::Base
  has_secure_password

  attr_accessor :current_password

  has_many :projects, dependent: :nullify

  has_many :favorites, dependent: :destroy
  has_many :favored_projects, through: :favorites, source: :project

  has_many :discussions, dependent: :nullify

  has_many :tasks, dependent: :destroy

  has_many :comments, dependent: :destroy



  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true,
                    uniqueness: true,
                    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :password, presence: true, if: :changing_password?
  validates :password_confirmation, presence: true, if: :changing_password?


  # This method will give you the ability to change your method's name so that you can read better!
  def logged_in?
    self.persisted?
  end


 def full_name
  "#{first_name} #{last_name}".titleize #<<< this will capitalize everything inside your string
 end


 private

 def changing_password?
   current_password.present?
 end
end
