class EventsController < ApplicationController
  def create
    site = Site.find_by_guid(site_id)
    if site.events.create(payload: event_params)
      head :ok
    else
      render json: {
          message: "could not create event",
          params: event_params
      }, status: :fail
    end
  end

  def site_id
    params.require(:event).permit(:app_id)[:app_id]
  end

  def event_params
    params.require(:event).permit!
  end
end