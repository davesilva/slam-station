class SlamJam < ActiveRecord::Base
  has_many :views, dependent: :destroy
  has_many :users, through: :views

  validates :youtube_id, uniqueness: true, presence: true

  scope :curated, -> { where(approved: true) }

  scope :nth, -> (n) { offset(n).first }
  scope :random, -> { nth(Random.rand(count)) }

  scope :unwatched_by, lambda { |user|
    where(
      <<-SQL
        id NOT IN (SELECT slam_jams.id FROM slam_jams
                   JOIN views ON slam_jams.id = views.slam_jam_id
                   WHERE views.user_id = #{user.id})
      SQL
    )
  }
end
