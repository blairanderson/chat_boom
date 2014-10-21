class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    site = Site.find_by_guid(site_id)
    if site
      # https://github.com/keenlabs/keen-gem/blob/master/README.md
      # https://keen.io/project/5445cb627d8cb9143f769ac4
      defaults = event_defaults.clone.merge({site_id: site.id})
      Keen.publish(:site_event, event_extras.merge(defaults))
      head :ok
    else
      render json: {
          message: "could not create event",
          params: event_payload
      }, status: :fail
    end
  end

private

  def site_id
    params.require(:site_id)
  end

  def event
    params.require(:event)
  end

  def event_defaults
    event.permit(:email, :created_at, :href)
  end

  def event_extras
    event.slice!(:email, :created_at, :href)
  end
end