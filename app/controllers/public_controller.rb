class PublicController < ApplicationController
  def home
    @user = current_user
  end

end
