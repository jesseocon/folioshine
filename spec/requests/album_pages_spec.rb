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
      click_button 'sign-in'
      visit new_album_path
    end
    
    it 'should have the correct fields' do
      should have_field('album[name]')
      should have_field('album[description]') 
    end
    
    describe 'filling in the new folio with correct information' do
      before do 
        fill_in 'album[name]', with: 'coolname'
        fill_in 'album[description]', with: 'cool description'
      end
      
      it 'should increment the Albums count' do
        expect { click_button 'folio-submit' }.to change(Album, :count)
      end
    end
    
    describe 'filling in the new folio with incorrect information', js: true do
      before do
        fill_in 'album[name]', with: 'coolname'
        fill_in 'album[description]', with: ''
      end
      
      it 'should not increment the Albums count and should display an error message' do
        sleep 3.seconds
        expect { click_button 'Create Folio!' }.not_to change(Album, :count)
        
      end
    end

  end
end