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

  # def voted_up_on?(item)
  #   if item.respond_to?(:cached_user_ids_liked)
  #     item.cached_user_ids_liked.include?(self.id)
  #   else
  #     super(item)
  #   end
  # end
end
