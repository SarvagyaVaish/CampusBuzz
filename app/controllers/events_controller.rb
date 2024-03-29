class EventsController < ApplicationController
  # GET /events/recreate
  # GET /events/recreate.json
  def recreate
    Event.all.each do |e|
      e.image.recreate_versions!
    end
    redirect_to :action => 'index'
  end

  # GET /events/grid
  # GET /events.grid.json
  def grid
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    if (params[:existing_venue] == 'false')
      @venue = Venue.create(params[:venue])
      @event.venue_id = @venue.id
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /events
  # POST /events.json
  def create_from_scrapper
    @event = Event.new(params[:event])

    # add category information
    @event.categories << Category.find_by_name(params[:category][:name])

    # add venue information
    @venue = Venue.find_by_name(params[:venue][:name])
    if @venue.nil?
      @venue = Venue.create(params[:venue])
    end
    @event.venue_id = @venue.id

    # sanitize end date if missing
    if @event.end_dt.nil?
      @event.end_dt = @event.start_dt + 1.hour
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        if (params[:existing_venue] == 'false')
          @venue = Venue.create(params[:venue])
          @event.venue_id = @venue.id
          @event.save
        end
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end
end
