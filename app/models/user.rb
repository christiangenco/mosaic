class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :submissions
  acts_as_voter

  def admin?
    email == "christian.genco@gmail.com"
  end

  def display_name
    username || name || email
  end
end
