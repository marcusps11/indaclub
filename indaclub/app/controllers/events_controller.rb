class EventsController < ApplicationController
  before_action :authenticate
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
   @q = Event.ransack(params[:q]) 
   if params[:q].present?
    @q = Event.ransack(params[:q]) 
    @events = @q.result(district:true)
  else
    @events = Event.all 
  end
  

  end


  # GET /events/1
  def show

  end

  # GET /events/new
  def new
    @event = Event.new
    @event.liked_by @user
    @event.votes_for.size
  end

  # GET /events/1/edit
  def edit

  end

  # POST /events
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /events/1
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :date, :ticketlink, :search, :event_image)
    end

    def upvote
      @event = Event.find(params[:id])
      @event.upvote_by current_user
      redirect_to events_path
    end



end

