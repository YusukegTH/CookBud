class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :search ]

  def home
  end

  def search
    @preference = current_user.preference if user_signed_in?
  end

  def profile
    @user = current_user
    @preference = @user.preference
  end
end
