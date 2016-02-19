class User < ActiveRecord::Base

  has_secure_password

  has_many :projects, dependent: :nullify

  validates :first_name, presence: true

  validates :last_name, presence: true

  validates :email, presence: true,
                    uniqueness: true,
                    format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i


  # This method will give you the ability to change your method's name so that you can read better!
  def logged_in?
    self.persisted?
  end


 def full_name
   "#{first_name} #{last_name}".titleize #<<< this will capitalize everything inside your string
 end


end
