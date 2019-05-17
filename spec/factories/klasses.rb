FactoryBot.define do
  factory :klass, class: 'Klasse' do
    teacher { nil }
    title { "MyString" }
    description { "MyText" }
  end
end
