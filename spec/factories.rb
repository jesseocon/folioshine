require 'factory_girl'

FactoryGirl.define do
  
  factory :user do
    email 'jesseocon@foobar.com'
    f_name 'Jesse'
    l_name 'Ocon'
    password 'foobar'
    password_confirmation 'foobar'
    phone '8582005141'
    verified true
    admin false
  end
  
  factory :album do
    name 'newalbum'
    description 'cooolnewalbum' 
  end
end 