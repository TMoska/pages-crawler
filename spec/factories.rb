FactoryGirl.define do
  factory :link do
    text "This is a link"
  end

  factory :header do
    text "This is a header"
  end

  factory :page do
    url "http://randomusefulwebsites.com"
  end
end
