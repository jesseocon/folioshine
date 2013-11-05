class Album < ActiveRecord::Base
  attr_accessible :album_handle, :name, :user_id, :description
  has_many :incoming_messages
  has_many :invitations
  belongs_to :user
  
  VALID_NAME_REGEX = /^[a-z1-9\-\.]*$/
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :name, format: { with: VALID_NAME_REGEX }
  validates :name, length: { maximum: 30, minimum: 2}
  validates :description, presence: true
  #
  before_create :make_handle
  
  scope :by_user, lambda { |uid| where(user_id: uid) }
  
  def make_handle
    self.album_handle = "#{self.name}@inbound.folioshine.com"
  end
  
  def send_invitations
    
  end
  
  def invited?
    
  end

end
