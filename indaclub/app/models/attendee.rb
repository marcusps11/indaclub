class Attendee < ActiveRecord::Base

  def attend
    @event = Event.find(params[:id])
    current_user.events << @event
    redirect_to @event
  end


end
