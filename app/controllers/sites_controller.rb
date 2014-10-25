class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy, :confirm]
  before_action :require_user_signed_in

  def index
    @sites = current_user.sites
  end

  def confirm
    if @site.events.count>0 && @site.confirmed!
      redirect_to site_path(@site)
    else
      redirect_to edit_site_path(@site)
    end
  end

  def new
    if current_user.sites.unconfirmed.count>0
      site = current_user.sites.unconfirmed.take(1)
    else
      site = current_user.sites.create(guid: SecureRandom.uuid, secret: SecureRandom.hex)
    end
    redirect_to edit_site_path(site)
  end

  def show
    # https://github.com/keenlabs/keen-gem/blob/master/README.md
    # https://keen.io/docs/data-analysis/extractions/
    # https://keen.io/project/5445cb627d8cb9143f769ac4
    site_filter = {
        property_name: "site_id",
        property_value: @site.id,
        operator: "eq"
    }
    @events = Keen.extraction('site_event', {
        filters: [site_filter]
    })
  end

  def edit
  end

  def update
    @site.update(site_params)
    redirect_to site_path(@site)
  end

  def destroy
    if @site.destroy
      redirect_to welcome_sites_path
    else
      render :edit
    end

  end

  def welcome
    sites = current_user.sites
    if sites.count > 1
      redirect_to sites_path
    elsif sites.count == 1
      site = sites.first
      if site.confirmed?
        redirect_to site_path(site)
      else
        redirect_to edit_site_path(site)
      end
    else
      redirect_to new_site_path
    end
  end

  private
  def set_site
    @site = Site.find(params[:id])
    unless @site
      redirect_to welcome_sites_path
    end
  end

  def site_params
    params.require(:site).permit(:name, :url)
  end

end