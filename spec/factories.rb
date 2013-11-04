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
  end
end

# => Album(id: integer, name: string, album_handle: string, user_id: integer, created_at: datetime, updated_at: datetime) 

# => User(id: integer, email: string, f_name: string, l_name: string, phone: string, password_digest: string, auth_token: string, password_reset_token: string, password_reset_at: datetime, verification_token: string, verified: boolean, last_4_digits: string, stripe_id: string, admin: boolean, created_at: datetime, updated_at: datetime) 