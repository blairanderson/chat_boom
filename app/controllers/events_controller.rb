class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    site = Site.find_by_guid(site_id)
    if site && site.events.create(payload: event_payload)
      head :ok
    else
      render json: {
          message: "could not create event",
          params: event_payload
      }, status: :fail
    end
  end

  def site_id
    params.require(:site_id)
  end

  def event_payload
    params.require(:event).permit!
  end
end