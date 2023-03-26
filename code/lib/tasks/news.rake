namespace :news do
  desc "Aggiorna le news da mostrare"
  task :fetch => :environment do
    puts "Updating news..."
    News.get_news()
    puts "#{Time.now} - Success!"
  end

end
