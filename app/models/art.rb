class Art < ActiveRecord::Base

  require 'open-uri'
  require 'json'

  # belongs_to :venues

  def as_json(options={})
    super(:only => [:title, :artist, :medium],
          :include => {
            :venues => {:only => [:name]}
          }
    )
  end

  def self.get_json
    url = "https://data.sfgov.org/resource/zfw6-95su.json?$select=artist, location_1, created_at, title, geometry, medium&$limit=50"
    @artjson = JSON.load(open(url).read)
    # @artjson = open(url)
    # response = RestClient.get 'https://www.kimonolabs.com/api/485d0k46?apikey=RG2ieKWJA4h3SOEFe9aVdTORGEFJa7ic'
  end

end
