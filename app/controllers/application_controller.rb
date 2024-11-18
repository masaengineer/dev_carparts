class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index], if: :landing_controller?

  private

  def landing_controller?
    controller_name == 'landing'
  end
end
