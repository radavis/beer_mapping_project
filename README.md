# Beer Mapping Project

Ruby code to retrieve information from the [Beer Mapping Project](http://beermapping.com/) [API](http://beermapping.com/api/).

## Instructions
* Clone this repo
* [Apply for an API key](http://beermapping.com/api/request_key)
* Copy the `.env.example` file to a file called `.env` and add your key to it.
* Use the BeerMappingProject class to make calls to the API.

```ruby
# example:
breweries = BeerMappingProject.new.city_search("Boston")
puts breweries.first.name
```
