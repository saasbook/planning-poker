class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote, required: false

  class << self
    def discuss_time(story_id)
      activities = activities_for_story(story_id)
      Activity.voting_start_time(activities) - Activity.discussion_start_time(activities)
    end

    def vote_variance(story_id)
      activities = Activity.where(story_id: story_id, activity_type: 'dashboard#vote').all
      votes = activities.map do |act|
        JSON.parse(act.activity_data)['vote'].to_f
      end
      sum = votes.inject(0.0) { |tsum, vt| tsum + vt }
      mean = sum / votes.length.to_f
      variance = votes.inject(0.0) { |tsum, vt| tsum + (vt - mean)**2 }
      variance = variance / (votes.length - 1).to_f
      Math.sqrt variance
    end

    def updated_by(story_id)
      Activity.where(activity_type: 'dashboard#update', story_id: story_id).last.user.username
    end

    def activities_for_story(story_id)
       Activity.where(story_id: story_id)
    end

    def discussion_start_time(activities)
      activities.where(activity_type: 'dashboard#detail').last.created_at
    end

    def voting_start_time(activities)
      activities.where(activity_type: 'dashboard#vote').first.created_at
    end
  end

end
