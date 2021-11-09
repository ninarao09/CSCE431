class AttendancerecordsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :get_event
  before_action :set_attendancerecord, only: %i[ show edit update destroy ]


  # GET /attendancerecords or /attendancerecords.json
  def index
    @attendancerecords = @event.attendancerecords
  end

  # GET /attendancerecords/1 or /attendancerecords/1.json
  def show

  end

  # GET /attendancerecords/new
  def new
    @attendancerecord = @event.attendancerecords.build
    #@player = 3.times { @attendancerecord.players.build }
    #@player = Player.count.times { @attendancerecord.players.build }
  end

  # GET /attendancerecords/1/edit
  def edit

  end

  # POST /attendancerecords or /attendancerecords.json
  def create
    #@event = Event.find(params[:event_id])
    @attendancerecord = @event.attendancerecords.build(attendancerecord_params)

    respond_to do |format|
      if @attendancerecord.save
        format.html { redirect_to attendancerecord_events_path(@event), notice: "Attendance record was successfully created." }
        format.json { render :show, status: :created, location: @attendancerecord }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @attendancerecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendancerecords/1 or /attendancerecords/1.json
  def update
    respond_to do |format|
      if @attendancerecord.update(attendancerecord_params)
        format.html { redirect_to event_attendancerecords_path(@event), notice: "Attendance record was successfully updated." }
        format.json { render :show, status: :ok, location: @attendancerecord }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @attendancerecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendancerecords/1 or /attendancerecords/1.json
  def destroy
    @attendancerecord.destroy
    respond_to do |format|
      format.html { redirect_to event_attendancerecords_path(@event), notice: "Attendance record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def get_event
      @event = Event.find(params[:event_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_attendancerecord
      @attendancerecord = @event.attendancerecords.find(params[:id])
  #    @attendancerecord = @event.attendancerecords.find(params[:id])

    end

    # Only allow a list of trusted parameters through.
    def attendancerecord_params
      params.require(:attendancerecord).permit(:attendancetype, :note, {players_attributes: [:name, :uin, :player_id]}, :event_id)
    end
end