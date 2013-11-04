require 'spec_helper'

describe Album do
  before do 
    @user = FactoryGirl.create(:user)
    @album = FactoryGirl.create(:album, user_id: @user.id)
  end
  
  subject { @album }
  
  it 'should respond to the following fields and be valid' do
    should respond_to(:name)
    should respond_to(:album_handle)
    should respond_to(:description)
    should be_valid
  end
  
  describe 'when the name is blank' do
    before { @album.name = '' }
    it { should_not be_valid }
  end
  
  describe 'when the name is a duplicate' do
    before do 
      @album2 = FactoryGirl.create(:album, name: 'differentname')
      @album2.name = @album.name
    end
    subject { @album2 }
    it { should_not be_valid }
  end
  
  describe 'when the name is invalid' do
    it 'should be invalid' do
      ['this~isinvalid', 'also_invalid', 'super#duperinvalid'].each do |invalid_name|
        @album.name = invalid_name
        @album.should_not be_valid
      end
    end
  end
  
  describe 'when the name has valid characters' do
    it 'should be valid' do
      ['this-is.a-validname', 'thisisavalidname'].each do |valid_name|
        @album.name = valid_name
        @album.should be_valid
      end
    end
  end
  
  describe 'when the name is too long (more than 30 characters)' do
    before { @album.name = "a" * 31 }
    it { should_not be_valid }
  end
  
  describe 'when the name is too short (less than 2 characters)' do
    before { @album.name = "a"  }
    it { should_not be_valid }
  end
end 
