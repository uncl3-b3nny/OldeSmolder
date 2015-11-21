class Suggestion < ActiveRecord::Base
  
  has_many :user_suggestions
  has_many :users, through: :user_suggestions

  def find_next_category 
    # to do: make user_suggestions specific to the current user, so we're not creating an array using EVERY user_suggestion ever created. 

    #to do: don't any of this in this manner.
    @user_suggestions = User_Suggestion.all
    
    @quality_time_array = []
    @words_of_affirmation_array = []
    @physical_touch_array = []
    @acts_of_service_array = []
    @tangible_gifts_array = []

    @user_suggestions.each do |x|
      if x.primary_category == "Quality Time" && x.workflow_state == "done"
        @quality_time_array.unshift(x)
      elsif x.primary_category == "Words of affirmation" && x.workflow_state == "done"
        @words_of_affirmation_array.unshift(x)
      elsif x.primary_category == "Physical Touch" && x.workflow_state == "done"
        @physical_touch_array.unshift(x)
      elsif x.primary_category == "Acts of Service" && x.workflow_state == "done"
        @acts_of_service_array.unshift(x)
      elsif x.primary_category == "Tangible Gifts" && x.workflow_state == "done"
        @tangible_gifts_array.unshift(x)
      end

      #bubble sort the arrays by length. Select the smallest. 1st tiebreaker by data, 2nd tiebreaker alphabetical order
      @quality_time_array.length = a
      @words_of_affirmation_array.length = b 
      @physical_touch_array.length = c
      @acts_of_service_array.length = d 
      @tangible_gifts_array.length = e

      @category_length_array = [a,b,c,d,e]
      @category_length_array.sort.first = f
      
      if f == a  
        @quality_time_array.first = @next_category
        @quality_time_array.first.workflow_state = "not_done"
      elsif f == b
        @words_of_affirmation_array.first = @next_category
        @words_of_affirmation_array.first.workflow_state = "not_done"
      elsif f == c
        @physical_touch_array.first = @next_category
        @physical_touch_array.first.workflow_state = "not_done"
      elsif f == d
        @acts_of_service_array.first = @next_category
        @acts_of_service_array.first.workflow_state = "not_done"
      elsif f == e
        @tangible_gifts_array.first = @next_category
        @tangible_gifts_array.first.workflow_state = "not_done"
      end
    @next_category
  end

  def build_next_category_array
    @suggestions = Suggestion.all
    @next_category_array = []
    @suggestions.each do |x|
      if @next_category == x.primary_category && x.workflow_state == "not_done"
        @next_category_array.unshift(x)
      end
    end
    @next_category_array
  end

  def display_next_suggestion(x)
    # display suggestion and change the workflow state to done
    @next_category_array.first
  end

# Can I use a "find /where" current_user.id == user_id AND primary_category == @next_category AND workflow_state == "not_done" ?

# will a SQL query accept an instance variable?
# i.e.
# scope :next_suggestion, Proc.new { |user_id, limit = 1| where('primary_category = @next_category AND workflow_state = "not_done" AND user_id = ?', user_id).order("id ASC").limit(limit) }

# So I actually need to run these on the join table objects to determine the next suggestions because they require workflow state which is a dynamic attribute that belongs to a "user specific suggestion". 
#actually no i don't, and all this can be done much more easily in the controller with a .where, but I'm leaving these here, cuz they were a learning experience.
  scope :next_quality_time, Proc.new { |user_id, limit = 1| where('primary_category = "Quality Time" AND workflow_state = "not_done" AND user_id = ?', user_id).order("id ASC").limit(limit) }

  scope :next_words_of_affirmation, Proc.new { |user_id, limit = 1| where('primary_category = "Words of affirmation" AND workflow_state = "not_done" AND user_id = ?', user_id).order("id ASC").limit(limit) }

  scope :next_acts_of_service, Proc.new { |user_id, limit = 1| where('primary_category = "Acts of Service" AND workflow_state = "not_done" AND user_id = ?', user_id).order("id ASC").limit(limit) }

  scope :next_physical_touch, Proc.new { |user_id, limit = 1| where('primary_category = "Physical Touch" AND workflow_state = "not_done" AND user_id = ?', user_id).order("id ASC").limit(limit) }

  scope :next_tangible_gift, Proc.new { |user_id, limit = 1| where('primary_category = "Tangible Gifts" AND workflow_state = "not_done" AND user_id = ?', user_id).order("id ASC").limit(limit) }

end

end

