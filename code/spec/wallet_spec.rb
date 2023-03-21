require 'rails_helper'
=begin
RSpec.describe Wallet,type: :model do
    describe 'aggiunta' do
        let! (:stock){create(:Azione,name:'MSFT')}
        it 'aggiunge azione al wallet' do
            results=Wallet.search('MSFT')
            expect(results).to include(stock)
        end
=end