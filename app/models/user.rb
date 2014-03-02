class User < ActiveRecord::Base
  has_many :views, dependent: :destroy
  has_many :slam_jams, through: :views

  recommends :slam_jams

  def slam!(slam_jam)
    View.find_or_create_by(slam_jam: slam_jam, user: self).touch
  end

  def desirable_slam_jams
    # Try to return curated SlamJams the user hasn't seen yet
    filtered = SlamJam.curated.unwatched_by(self)
    return filtered if filtered.any?

    # Try to return SlamJams the user hasn't seen yet
    filtered = SlamJam.unwatched_by(self)
    return filtered if filtered.any?

    # Try to return SlamJams the user hasn't seen today
    filtered = slam_jams.where('views.updated_at < ?', 1.day.ago)
    return filtered if filtered.any?

    # Return the least recently viewed half of the slam jams
    slam_jams.order('views.updated_at ASC').limit((SlamJam.count / 2.0).ceil)
  end
end
