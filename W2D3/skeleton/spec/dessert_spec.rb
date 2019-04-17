require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
    subject(:dessert) do
    Dessert.new("brownie", 12, "manju")
    end

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(12)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients.class).to eq(Array)
      expect(dessert.ingredients.length).to eq(0)
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {(initialize("brownie", "six", "manju"))}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients.length).to eq(0)
      dessert.add_ingredient("flour")
      expect(dessert.ingredients.length).to eq(1)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("egg")
      dessert.add_ingredient("flour")
      expect(dessert.ingredients).to eq(["egg", "flour"])
      dessert.mix!
      expect(dessert.ingredients).to_not eq(["egg", "flour"])
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect().to eq()
    end

    it "raises an error if the amount is greater than the quantity" do
      expect() {()}.to raise_error(ArgumentError)
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect().to eq()
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(). to eq()
    end
  end
end
