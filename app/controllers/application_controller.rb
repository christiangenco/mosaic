class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def ensure_admin!
    authenticate_user!

    unless user_signed_in? && current_user.admin?
      redirect_to "/", :flash => {:error => "You need to be an admin to do that."}
    end
  end
end
