# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slam_jam do
    sequence(:youtube_id) { |n| "7QTjmc9RGs8#{n}" }
    artist 'Duran Duran'
    title 'Hungry Like the Slam (Quad City DJs vs. Duran Duran)'
    img_url 'http://www.wikipedia.org/duran_duran.jpg'
  end
end
