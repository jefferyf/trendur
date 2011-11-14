class User < ActiveRecord::Base
  
  #Relationship to Authentication
   has_many :authentications
   
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :last_name, :first_name, :role, :image_url, :email, :password, :password_confirmation, :remember_me
  
  #Validations
   validates_presence_of :role
   #validates_uniqueness_of :user, :scope => [:]
  
  #Checks to see if the email is blank on API return, and fills in other fields with API data if they are not blank
  def apply_omniauth(omniauth)
    self.email = omniauth['info']['email'] if email.blank?
    self.role = "notadmin"
    
    self.username = omniauth['info']['name'] if username.blank?
    self.last_name = omniauth['info']['name'] if last_name.blank?
    self.first_name = omniauth['info']['name'] if first_name.blank?
    self.image_url = omniauth['info']['image'] if image_url.blank?
    
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def get_profile_image(omniauth)
    puts "Inside get_profile_image"
    self.image_url = omniauth['user_info']['image'] #if image_url.blank?
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super #Says that passwords are not required if Authenticating with Omniauth
  end

  #These are the Roles that are available for use.
  ROLES = %w[admin notadmin]
  
end
