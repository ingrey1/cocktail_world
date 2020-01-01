require 'json'
require 'rest-client'
require 'awesome_print'

#class GetData

  

  
     
    #1.  get an array of all the URLS I need to get a list of drinks
    def all_urls
      all_letters = ('a'..'z').to_a
   
       all_letters.map do |letter|
   
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=#{letter}"
       end
   end
    # response = RestClient.get(https://www.thecocktaildb.com/api.php)
    # data_hash = JSON.parse(response)

    # 3. put each hash into an array
  
    # 2.Then pass each URL from the resulting array in #1 into the restclient, JSON.parse methods
   def get_list_of_cocktails
      all_urls.map do |url|
       #RestClient.get(url)
       JSON.parse(RestClient.get(url))
      end
   end
   
 #ap get_list_of_cocktails[25]


  #now simplify the data structure.  Get just each drink into an array

  def simplify_the_cocktail_data_structure
    new_array = []
    get_list_of_cocktails.each do |complicated_nested_hash|
      #complicated_nested_hash is a HASH
      #iterate over HASH
      complicated_nested_hash.map do |drinks_key, array_of_values|

        #ap array_of_values   This DOES display an array of hashes, each hash
        # is an individual drink info hash

        # puts array_of_values.class  
        # some array_of_values are NILCLASS...cannot use each on NILCLASS

        if array_of_values and array_of_values.each do |individual_drink_info_hash|
           new_array << individual_drink_info_hash
        end
       end
    end
  end
  new_array
end

ap simplify_the_cocktail_data_structure
  