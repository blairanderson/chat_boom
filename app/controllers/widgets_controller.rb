class WidgetsController <  ActionController::Base
  skip_before_action :verify_authenticity_token
  layout false

  def show
    binding.pry
    @site = Site.find_by_guid(params[:id])
    unless @site
      head :error
    end
  end

end