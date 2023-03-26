namespace :azioni do
    desc "Aggiorna le azioni da mostrare"
    task :update => :environment do
      puts "Updating stocks..."
      Azione.aggiorna_azioni()
      puts "#{Time.now} - Success!"
    end
  
  end