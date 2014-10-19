class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  before_action :require_user_signed_in

  skip_before_action :verify_authenticity_token, only: [:widget]
  skip_before_action :require_user_signed_in, only: [:widget]

  def widget
    @site = Site.find_by_guid(params[:guid])
    render layout: false
  end

  def index
    @sites = current_user.sites
  end

  def new
    if current_user.sites.unconfirmed.count>0
      site = current_user.sites.unconfirmed.take(1)
    else
      site = current_user.sites.create({guid: SecureRandom.uuid})
    end
    redirect_to edit_site_path(site)
  end

  def show
  end

  def edit
  end

  def update
    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      redirect_to site_path(@site)
    end
  end

  def destroy
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