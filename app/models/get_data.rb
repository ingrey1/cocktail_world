require 'json'
require 'rest-client'

class GetData

  

  def get_data
    response = RestClient.get(https://www.thecocktaildb.com/api.php)
    data_hash = JSON.parse(response)
  end

end