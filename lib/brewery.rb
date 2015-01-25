class Brewery
  attr_reader :name, :type, :address, :city, :state, :zip,
    :country, :phone_number, :review_url, :map_link

  def initialize(attributes)
    @beer_mapping_project_id = attributes["id"]
    @name = attributes["name"]
    @type = attributes["status"]
    @address = attributes["street"]
    @city = attributes["city"]
    @state = attributes["state"]
    @zip = attributes["zip"]
    @country = attributes["country"]
    @phone_number = attributes["phone"]
    @review_url = attributes["reviewlink"]
    @map_link = attributes["proxylink"]
  end
end
