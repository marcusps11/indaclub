require 'httparty'

gigatools_url = "http://api.gigatools.com/"
api_key = "c8dff564d25bbf7276"

response = HTTParty.get(gigatools_url, query:{
  #required
  account: api_key

  #options
  keyword: "London"

  events = response[0][1]

  options = {
    name: offer['name'],
    date: offer['image_url_large'],
    description: offer['description'],
    price_retail: offer['price_retail'],
    url: offer['url']
  }

  })

# def get_api_result city, type=nil
#   uri = if type.nil? || type == :s
#     "city.json?cities[]=#{city}&api_key=#{API_KEY}"
#   elsif type == :id 
#     "city.json?cities[]=#{city}&api_key=#{API_KEY}"
#   end
#    HTTParty.get URL + URI.encode(uri)
# end

# result = get_api_result("Ibiza")

# json_result = JSON.parse(result)

# binding.pry



 require 'httparty'
# require 'pry'

popshops_url = 'http://api.popshops.com/v3/products.json'
catalog_key  = ENV['POPSHOPS_CATALOG_KEY']
api_key      = ENV['POPSHOPS_API_KEY']

response = HTTParty.get(popshops_url, query: {
  # Required
  catalog: catalog_key,
  account: api_key,

  # Optional
  results_per_page: 100,
  keyword: "nike",
  category: 25245
  })

products = response['results']['products']['product'].each do |product|
  product['offers']['offer'].each do |offer|

    options = {
      name: offer['name'],
      image_url_large: offer['image_url_large'],
      description: offer['description'],
      price_retail: offer['price_retail'],
      url: offer['url']
    }

    Product.create!(options)
  end
end 