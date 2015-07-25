# == Schema Information
#
# Table name: arts
#
#  id            :integer          not null, primary key
#  title         :string
#  artist        :string
#  city          :string
#  medium        :string
#  latitude      :float
#  longitude     :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  circa_year    :integer
#  provider_id   :string
#  provider_name :string
#

class Art < ActiveRecord::Base

  belongs_to :venues

  # Step 1: Pull in the data
  def self.get_sf_data
    url = "https://data.sfgov.org/resource/zfw6-95su.json?$select=artist, _id_, location_1, created_at, title, geometry, medium&$limit=50"
    # GET data from source but will be a string
    get_request = (RestClient::Resource.new url, verify_ssl: false).get
    # transform data into JSON
    data = JSON.parse(get_request)
    return data
  end

  # Step 2 -
  def self.add_sf_data
    raw_data = Art.get_sf_data
    art_data = remove_header_from_data(raw_data)
    # iterate throught each data point and add to database
    art_data.each do |art|
      Art.create(
        title: art["title"],
        artist: art["artist"],
        city: "san_francisco", #hard coded for now
        medium: art["medium"],
        longitude: get_location(art)[0],
        latitude: get_location(art)[1],
        provider_id: art["_id_"],
        provider_name: "sf_data_gov",
        circa_year: art["created_at"].to_i
        )
    end
  end

  # can only be called within a method
  private

  # clean data, remove header
  def self.remove_header_from_data(data)
    if data.first["title"] == "title" && data.first["artist"] == "artist"
      data.shift
    end
      return data
  end

  # clean data pull out lon/lat
  def self.get_location(art)
    location = JSON.parse(art["geometry"])
    latitude = location["coordinates"][1]
    longitude = location["coordinates"][0]
    return latitude, longitude
  end


end
