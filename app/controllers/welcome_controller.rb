class WelcomeController < ApplicationController
  def root
    if current_user
      redirect_to welcome_sites_path
    end
  end
end