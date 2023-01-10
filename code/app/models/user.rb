class User < ApplicationRecord
    
    validates :nome,:cognome ,length: { minimum: 2 }
    validates :nome,:cognome,:email, presence: true 
    
   

    


   
      
    


end
