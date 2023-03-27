require 'rails_helper'

RSpec.describe IndexController, type: :controller do

  before(:all) do
    @user=FactoryBot.create(:user)
    @wallet= FactoryBot.create(:wallet)
  end

  after(:all) do
    @user.destroy
  end

  describe "POST #cerca" do
    context "con valore accettato" do
        it "rimanda all'azione" do
            @azione=Azione.find_by(isin:"AAPL")
            id1=Azione.find_by(isin:"AAPL").id
            id1=id1.to_s
            expect(post :cerca,params:{ricerca:@azione.isin+"(azione)"}).to redirect_to("http://localhost:3000/azione/"+id1)#,allow_other_host: true)
        end
        it "rimanda all'utente" do
            @userb=User.find_by(username:"ACCprova")
            id2=@userb.id.to_s
            expect(post :cerca,params:{ricerca:@userb.username},commit: "Submit").to redirect_to("/users/#{id2}")#,allow_other_host:true)
            #expect(response).to render_template("")
        end
    end
    #context "con valore non accettato" do
    #    it "ritorna errore" do
    #end
#end
end
end