class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :destroy] 
  respond_to :json, :js, :html
  def index
    @users = User.all
    @user = User.new

    @next_event = Event.where("start > ? AND workflow_state LIKE ?", DateTime.now, "not_done").order("start ASC").limit(1).first

    @next_quality_time_suggestion = Suggestion.where('primary_category LIKE ? AND workflow_state LIKE ? AND user_id LIKE ?', "Quality Time", "not_done", current_user.id).first

    @next_words_of_affirmation_suggestion = Suggestion.where("primary_category LIKE ? AND workflow_state LIKE ? AND user_id LIKE ?", "Words of affirmation", "not_done", current_user.id).first
  end

  def show
    @events = Event.all
    @users = User.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    # <%= f.datetime_select :start, class: "date-field form-control validate-field date", data_validation_type: "date", placeholder: "dd/mm/yy" %>

    @event = Event.create event_params
      respond_to do |format|
        if @event.save
          flash[:notice] = "Event was successfully saved"
          format.html { redirect_to events_path }
          format.js { render json: @event.as_json }
        else
          flash[:error] = "Event was not successfully saved"
          format.html { redirect_to events_path }
        end
      end
  end

  def update
    #find the objects you want to update with the ids passed along through your ajax request
    event = Event.find params[:id]
    suggestion = Suggestion.find suggestion_params[:id]
    
    #update each object
    event.update(event_params)
    suggestion.update(suggestion_params)
    
    #find the next objects you want to work with so that they're available in the re-painted partial
    @next_event = Event.where("start > ? AND workflow_state LIKE ?", DateTime.now, "not_done").order("start ASC").limit(1).first 
    @next_words_of_affirmation_suggestion = Suggestion.where("primary_category LIKE ? AND workflow_state LIKE ? AND user_id LIKE ?", "Words of affirmation", "not_done", current_user.id).first
    @next_quality_time_suggestion = Suggestion.where('primary_category LIKE ? AND workflow_state LIKE ? AND user_id LIKE ?', "Quality Time", "not_done", current_user.id).first
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(
       :title, 
       :date, 
       :allDay, 
       :start, 
       :end, 
       :url, 
       :className, 
       :editable, 
       :startEditable, 
       :endEditable, 
       :durationEditable, 
       :color, 
       :backgroundColor, 
       :borderColor, 
       :textColor, 
       :event_type, 
       :user_id, 
       :workflow_state, 
       :notes)
    end
    #To do: whitelist suggestions and events for users via join tables
      # def user_params
      #   event_ids:[]
      #   suggestion_ids: []
      # end

    def suggestion_params
      params.require(:suggestion).permit(
        :id,
        :primary_category, 
        :primary_subcategory, 
        :secondary_category, 
        :user_id, 
        :name, 
        :workflow_state, 
        :content_title, 
        :content, 
        :options, 
        :address, 
        :time_frame, 
        :budget_size, 
        :suggestion_image_file_path, 
        :url
        )
    end
  end

