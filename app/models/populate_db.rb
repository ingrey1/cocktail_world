class PopulateDB

    attr_reader :cocktail_data, :cocktails, :ingredients, :cocktail_ingredients 

    def initialize(cocktail_data)
      @cocktail_data = cocktail_data
      @ingredients = []
      @cocktails = []
      @cocktail_ingredients = []
    end
    
    def build_cocktails
       
    end
    
    def build_ingredients 

    end 

    def build_cocktail_ingredients

    end 

    def populate_cocktails

    end 

    def populate_ingredients
    
    end
    
    def populate_db 
      populate_cocktails()
      populate_ingredients()
      populate_cocktail_ingredients()
    end 

end 