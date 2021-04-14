FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1aaaaa' }
    password_confirmation { password }
    family_name           { '田中' }
    fist_name             { '太郎' }
    family_name_kana      { 'タナカ' }
    fist_name_kana        { 'タロウ' }
    birthdate             { '1999-09-09' }
  end
end
