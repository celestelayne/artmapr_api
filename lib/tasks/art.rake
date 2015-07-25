namespace :art do
  desc "add art_data"
  # Rake art:sf_data in rails c
  task sf_data: :environment do
    Art.add_sf_data
    puts "SF Data Added"
  end
end
