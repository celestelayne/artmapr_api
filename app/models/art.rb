class Art < ActiveRecord::Base

  require 'rest_client'
  require 'open-uri'
  require 'json'

  belongs_to :venues

  def self.get_json
    url = "https://data.sfgov.org/resource/zfw6-95su.json?$select=artist, location_1, created_at, title, geometry, medium&$limit=50"
    resource = RestClient::Resource.new(url, :method => :get, :verify_ssl => false)
    data = resource.get
    artjson = JSON.load(data).to_json
  end

  def as_json(options={})
    super(:only => [:title, :artist, :medium],
          :include => {
            :venues => {:only => [:name]}
          }
    )
  end

end
