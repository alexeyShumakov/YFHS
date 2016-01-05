FactoryGirl.define do
  factory :user do
    email 'test@mail.com'
    name 'John'
    nickname 'user'
    public_nickname 'User'
    password  'password'
    password_confirmation  'password'
    confirmed_at Date.today
    role  0
  end

end
