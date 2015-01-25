require 'dotenv'
Dotenv.load
require 'httparty'
require 'cgi'
require_relative 'brewery'

class BeerMappingProject
  include HTTParty

  base_uri 'http://beermapping.com/webservice'

  def initialize(key=ENV['BEER_MAPPING_API_KEY'])
    @key = key

    if @key.nil?
      raise 'No API key for the BeerMappingProject!'
    end
  end

  # search breweries by name
  def name_search(query)
    get('locquery', query)
  end

  # search breweries by city
  def city_search(query)
    get('loccity', query)
  end

  # search breweries by state
  def state_search(query)
    get('locstate', query)
  end

  # builds the endpoint url
  # calls the HTTParty.get method
  # returns an array of Brewery objects
  def get(service, query)
    escaped_query = CGI::escape(query)
    api_response = self.class.get("/#{service}/#{@key}/#{escaped_query}")
    api_results = api_response["bmp_locations"]["location"]
    brewify(api_results)
  end

  # builds a Brewery based on records return from api call
  def brewify(results)
    breweries = []

    if results.class == Hash
      breweries << Brewery.new(results)

    elsif results.class == Array
      results.each do |attributes|
        breweries << Brewery.new(attributes)
      end
    end

    breweries
  end
end
