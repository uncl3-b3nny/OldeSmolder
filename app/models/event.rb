class Event < ActiveRecord::Base
    # needs validation for attributes
  #Why distinguish between events and suggestion? why not just create a boolean that designates whether or not a suggestion has been selected, and added to the calendar/history?
  belongs_to :user

  has_attached_file :event_image,
    :storage => :dropbox,
    :dropbox_credentials => { app_key: ENV['APP_KEY'],
      app_secret: ENV['APP_SECRET'],
      access_token: ENV['ACCESS_TOKEN'],
      access_token_secret: ENV['ACCESS_TOKEN_SECRET'],
      user_id: ENV['USER_ID'],
      access_type: 'app_folder'}

  # This proc is just like a def method_name... end. It can be called just like a class method, e.g. 
  # Event.next_event. 
  scope :next_event, Proc.new { |after = DateTime.now, limit = 1| where('start > ? AND workflow_state = "not_done"', after).order("start ASC").limit(limit) }

  scope :three_carousel_events, Proc.new { |user_id, before = DateTime.now, limit = 3| where('start < ? AND workflow_state = "done" AND user_id = ?', before, user_id).order("start ASC").limit(limit) }

  scope :past_events, Proc.new { |before = DateTime.now| where('start < ? AND workflow_state = "done"', before).order("start ASC")}

  scope :future_events, Proc.new { |after = DateTime.now| where('start > ?', after).order("start ASC")}


end
