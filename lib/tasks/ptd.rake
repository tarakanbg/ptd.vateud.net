namespace :ptd do
  task :update_ratings => :environment do 
    AtcRating.update_all("id = 12", "id = 10")
    AtcRating.update_all("id = 11", "id = 9")
    AtcRating.update_all("id = 10", "id = 8")
    AtcRating.update_all("id = 8", "id = 7")
    AtcRating.update_all("id = 7", "id = 6")
  end

  task :expired_theory => :environment do 
    Pilot.delay.process_expired_theory
  end
end
