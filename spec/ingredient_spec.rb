require "pry"
require_relative "../config/environment.rb"

describe Ingredient do
  it("should initialize without throwing an error") do
    expect { Ingredient.new }.to_not raise_error
  end

  context "When using inherited active-record class methods, no errors are thrown" do
    it("should not throw an error when .all is called on Ingredient") do
      expect { Ingredient.all }.to_not raise_error
    end
  end

  context "After a new instance has been created, instance attributes are accessible" do
    ingredient1 = Ingredient.new(name: "Sugar")
    it("should have an accessible name instance attribute") do
      expect(ingredient1.name).to eq("Sugar")
    end
    context "After a new instance is created, active-record methods are available to the instance" do
      ingredient2 = Ingredient.new(name: "Spice")
      it("should be able to save itself to the db") do
        expect { ingredient2.save }.to_not raise_error
        expect(Ingredient.all.include?(ingredient2)).to eq(true)
      end
    end
  end
end
