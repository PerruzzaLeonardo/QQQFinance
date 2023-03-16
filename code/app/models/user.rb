class User < ApplicationRecord
  has_many :comment ,dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2,:facebook]
  
    validates :nome,length: { minimum: 2 }
    validates :nome,:password, :email, presence: true 
    validates :username, presence: true,uniqueness: {case_sensitive: true}

 
     
    def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.nome=auth.info.name
        user.username=auth.info.name
        user.pubblico="si"

      end
    end
  
   

    


   
      
    


end
