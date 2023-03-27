require 'rails_helper'

RSpec.describe User, type: :model do
    context "Create an user" do

 
        it "should not be permitted without name" do
            u=User.create(:email=>"leo@gmail.com",:password=>"qwerty",:username=>"Leo",:pubblico=>"si")
            expect(u).to be_invalid
        end 

        it "should not be permitted without nickname" do
            u=User.create(:nome=>"Leo",:email=>"leo@gmail.com",:password=>"qwerty",:pubblico=>"si")
            expect(u).to be_invalid
        end 

        it "should not be permitted when the nickname has already been choosen" do
            u=User.create(:nome=>"Leo",:email=>"leo@gmail.com",:password=>"qwerty",:username=>"Leo",:pubblico=>"si")
            p=User.create(:nome=>"Paolo",:email=>"paolo@gmail.com",:password=>"123456",:username=>"Leo",:pubblico=>"si")
            expect(p).to be_invalid
        end 

        it "should not be permitted without email" do
            u=User.create(:nome=>"Leo",:username=>"leo",:password=>"qwerty",:pubblico=>"si")
            expect(u).to be_invalid
        end 
        
        it "should not be permitted when the email has already been choosen" do
            u=User.create(:nome=>"Leo",:email=>"leo@gmail.com",:password=>"qwerty",:username=>"Leo",:pubblico=>"si")
            p=User.create(:nome=>"Paolo",:email=>"leo@gmail.com",:password=>"123456",:username=>"Paolo",:pubblico=>"si")
            expect(p).to be_invalid
        end 

        it "should not be permitted without pubblico" do
            u=User.create(:nome=>"Leo",:email=>"leo@gmail.com",:password=>"qwerty",:username=>"Leo")
            expect(u).to be_invalid
        end 

        it "should not be permitted with password too short(minimum is 6 characters)" do
            u=User.create(:nome=>"Leo",:email=>"leo@gmail.com",:password=>"q",:username=>"Leo",:pubblico=>"si")
            expect(u).to be_invalid
        end 

        it "should not be permitted without password" do
            u=User.create(:nome=>"Leo",:email=>"leo@gmail.com",:pubblico=>"si",:username=>"Leo")
            expect(u).to be_invalid
        end 


    end 
end 
    