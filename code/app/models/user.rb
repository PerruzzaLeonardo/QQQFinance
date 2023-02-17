class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    validates :nome,:cognome ,length: { minimum: 2 }
    validates :nome,:cognome,:email, presence: true 
    
   

    


   
      
    


end
