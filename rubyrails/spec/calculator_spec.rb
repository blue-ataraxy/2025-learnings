
require './calculator.rb' # tells the spec where the Calculator class is being defined

describe Calculator do
    describe "#add" do
        it "returns the sum of any number of numbers" do
            calculator = Calculator.new
            expect(calculator.add(5, 2)).to eql(7)
            expect(calculator.add(5, 2, 3)).to eql(10)
            expect(calculator.add(1)).to eql(1)
        end
    end
    describe "#subtract" do
        it "returns the value of first number subtracted by second number" do
            calculator = Calculator.new
            expect(calculator.subtract(3, 2)).to eql(1)
        end
    end
end