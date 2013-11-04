require 'spec_helper'

describe 'Albums Pages' do

  let(:user) { FactoryGirl.create(:user, admin: true) }
  let(:album) { FactoryGirl.create(:album, user_id: @user.id) }
  
  subject { page }
  
  describe 'the new album page' do
    before do
      visit root_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_button 'Sign In!'
      visit new_album_path
    end
    it { should have_field('album[name]') }
  end
end